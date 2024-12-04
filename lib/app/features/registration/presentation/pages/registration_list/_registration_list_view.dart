// 🎯 Dart imports:
import 'dart:ui';
// 🐦 Flutter imports:
import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration_list/edit_registration_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 📦 Package imports:
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart' as intl;
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';
import 'add_registration_popup.dart';

class RegistrationsListView extends StatefulWidget {
  const RegistrationsListView({super.key});

  @override
  _RegistrationsListViewState createState() => _RegistrationsListViewState();
}

class _RegistrationsListViewState extends State<RegistrationsListView> {
  ///_____________________________________________________________________Variables_______________________________
  late List<Registration> _filteredData;
  late List<Registration> paginatedData;
  final ScrollController _scrollController = ScrollController();
  List<Registration> registrations = [];
  int _currentPage = 0;
  int _rowsPerPage = 10;
  String _searchQuery = '';
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(registrations);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ///_____________________________________________________________________data__________________________________
  /* List<UserDataModel> get _currentPageData {
    if (_searchQuery.isNotEmpty) {
      _filteredData = users
          .where(
            (data) =>
                data.username
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase()) ||
                data.email.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                data.phone.contains(
                  _searchQuery,
                ),
          )
          .toList();
    } else {
      _filteredData = List.from(users);
    }

    int start = _currentPage * _rowsPerPage;
    int end = start + _rowsPerPage;
    return _filteredData.sublist(
        start, end > _filteredData.length ? _filteredData.length : end);
  } */

  ///_____________________________________________________________________Search_query_________________________
  void _setSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 0; // Reset to the first page when searching
    });
  }

  ///_____________________________________________________________________Add_User_____________________________
  void _showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: const AddRegistrationDialog(),
        );
      },
    );
  }

  ///_____________________________________________________________________Edit User Dialog_________________________________

  void _showEditFormDialog(Registration registrationData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: EditRegistrationDialog(
            registrationData: registrationData,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<RegistrationBloc>().add(RegistrationsListEvent());
    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 480,
          value: _SizeInfo(
            alertFontSize: 12,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 481,
          end: 576,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 577,
          end: 992,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;

    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
      if (state is RegistrationsListState) {
        registrations = state.registrations;

        if (_searchQuery.isNotEmpty) {
          _filteredData = registrations;
          // .where((data) =>
          //     data.name!.toLowerCase().contains(_searchQuery.toLowerCase()))
          // .toList();
        } else {
          _filteredData = List.from(registrations);
        }

        // int start = _currentPage * _rowsPerPage;
        // int end = start + _rowsPerPage;
        // _filteredData.sublist(
        //     start, end > _filteredData.length ? _filteredData.length : end);
        int start = _currentPage * _rowsPerPage;
        int end = start + _rowsPerPage;
        paginatedData = _filteredData.sublist(
            start, end > _filteredData.length ? _filteredData.length : end);
      }

      return Scaffold(
        body: Padding(
          padding: sizeInfo.padding,
          child: ShadowContainer(
            showHeader: false,
            contentPadding: EdgeInsets.zero,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final isMobile = constraints.maxWidth < 481;
                  final isTablet =
                      constraints.maxWidth < 992 && constraints.maxWidth >= 481;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //______________________________________________________________________Header__________________
                      isMobile
                          ? Padding(
                              padding: sizeInfo.padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: showingValueDropDown(
                                            isTablet: isTablet,
                                            isMobile: isMobile,
                                            textTheme: textTheme),
                                      ),
                                      const Spacer(),
                                      addRegistrationButton(textTheme),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  searchFormField(textTheme: textTheme),
                                ],
                              ),
                            )
                          : Padding(
                              padding: sizeInfo.padding,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: showingValueDropDown(
                                      isTablet: isTablet,
                                      isMobile: isMobile,
                                      textTheme: textTheme,
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    flex: isTablet || isMobile ? 2 : 3,
                                    child:
                                        searchFormField(textTheme: textTheme),
                                  ),
                                  Spacer(flex: isTablet || isMobile ? 1 : 2),
                                  addRegistrationButton(textTheme),
                                ],
                              ),
                            ),

                      //______________________________________________________________________Data_table__________________
                      isMobile || isTablet
                          ? RawScrollbar(
                              padding: const EdgeInsets.only(left: 18),
                              trackBorderColor: theme.colorScheme.surface,
                              trackVisibility: true,
                              scrollbarOrientation: ScrollbarOrientation.bottom,
                              controller: _scrollController,
                              thumbVisibility: true,
                              thickness: 8.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SingleChildScrollView(
                                    controller: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        minWidth: constraints.maxWidth,
                                      ),
                                      child: RegistrationListDataTable(
                                          context, registrations),
                                    ),
                                  ),
                                  Padding(
                                    padding: sizeInfo.padding,
                                    child: Text(
                                      '${l.S.of(context).showing} ${_currentPage * _rowsPerPage + 1} ${l.S.of(context).to} ${_currentPage * _rowsPerPage + registrations.length} ${l.S.of(context).OF} ${_filteredData.length} ${l.S.of(context).entries}',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: constraints.maxWidth,
                                ),
                                child: RegistrationListDataTable(
                                    context, registrations),
                              ),
                            ),

                      //______________________________________________________________________footer__________________
                      isTablet || isMobile
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: sizeInfo.padding,
                              child: paginatedSection(theme, textTheme),
                            ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
    });
  }

  ///_____________________________________________________________________add_user_button___________________________
  ElevatedButton addRegistrationButton(TextTheme textTheme) {
    final lang = l.S.of(context);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      ),
      onPressed: () {
        setState(() {
          _showFormDialog(context);
        });
      },
      label: Text(
        lang.newRegistration,
        //'Add New User',
        style: textTheme.bodySmall?.copyWith(
          color: FinanceAppColors.kWhiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconAlignment: IconAlignment.start,
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: FinanceAppColors.kWhiteColor,
        size: 20.0,
      ),
    );
  }

  ///_____________________________________________________________________pagination_functions_______________________
  int get _totalPages => (_filteredData.length / _rowsPerPage).ceil();

  ///_____________________________________select_dropdown_val_________
  void _setRowsPerPage(int value) {
    setState(() {
      _rowsPerPage = value;
      _currentPage = 0;
    });
  }

  ///_____________________________________go_next_page________________
  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  ///_____________________________________go_previous_page____________
  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  ///_______________________________________________________________pagination_footer_______________________________
  Row paginatedSection(ThemeData theme, TextTheme textTheme) {
    final lang = l.S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${l.S.of(context).showing} ${_currentPage * _rowsPerPage + 1} ${l.S.of(context).to} ${_currentPage * _rowsPerPage + registrations.length} ${l.S.of(context).OF} ${_filteredData.length} ${l.S.of(context).entries}',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: _goToPreviousPage,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: theme.colorScheme.outline),
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
              child: Text(
                lang.previous,
                //'Previous',
                style: textTheme.bodySmall,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              height: 32,
              decoration: const BoxDecoration(
                color: FinanceAppColors.kPrimary700,
              ),
              child: Center(
                child: Text(
                  '${_currentPage + 1}',
                  style: textTheme.bodySmall?.copyWith(
                    color: FinanceAppColors.kWhiteColor,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              height: 32,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                border: Border.all(color: theme.colorScheme.outline),
              ),
              child: Center(
                child: Text(
                  '$_totalPages',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _goToNextPage,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                side: BorderSide(color: theme.colorScheme.outline),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ),
              child: Text(
                lang.next,
                //'Next',
                style: textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }

  ///_______________________________________________________________Search_Field___________________________________
  TextFormField searchFormField({required TextTheme textTheme}) {
    final lang = l.S.of(context);
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        // hintText: 'Search...',
        hintText: '${lang.search}...',
        hintStyle: textTheme.bodySmall,
        suffixIcon: Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: FinanceAppColors.kPrimary700,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: const Icon(IconlyLight.search,
              color: FinanceAppColors.kWhiteColor),
        ),
      ),
      onChanged: (value) {
        _setSearchQuery(value);
      },
    );
  }

  ///_______________________________________________________________DropDownList___________________________________
  DropdownButtonFormField<int> showingValueDropDown(
      {required bool isTablet,
      required bool isMobile,
      required TextTheme textTheme}) {
    return DropdownButtonFormField<int>(
      isExpanded: true,
      value: _rowsPerPage,
      items: [10, 20, 30, 40, 50].map((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(
            isTablet || isMobile
                ? '$value'
                : '${l.S.of(context).show} ${intl.NumberFormat.currency(symbol: '', decimalDigits: 0).format(value)}',
            style: textTheme.bodySmall,
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          _setRowsPerPage(value);
        }
      },
    );
  }

  ///_______________________________________________________________User_List_Data_Table___________________________
  Theme RegistrationListDataTable(
      BuildContext context, List<Registration> Registrations) {
    final lang = l.S.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Theme(
      data: ThemeData(
          dividerColor: theme.colorScheme.outline,
          dividerTheme: DividerThemeData(
            color: theme.colorScheme.outline,
          )),
      child: DataTable(
        checkboxHorizontalMargin: 16,
        headingTextStyle: textTheme.titleMedium,
        dataTextStyle: textTheme.bodySmall,
        headingRowColor: WidgetStateProperty.all(theme.colorScheme.surface),
        showBottomBorder: true,
        columns: [
          DataColumn(
            label: Row(
              children: [
                Checkbox(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  value: _selectAll,
                  onChanged: (value) {
                    _selectAllRows(value ?? false);
                  },
                ),
                const SizedBox(width: 12.0),
                //Text('Serial'),
                //Text(lang.serial),
              ],
            ),
          ),
          DataColumn(label: Text(lang.name)),
          DataColumn(label: Text(lang.actions)),
        ],
        rows: Registrations.map(
          (data) {
            return DataRow(
              color: WidgetStateColor.transparent,
              selected: data.isSelected,
              cells: [
                DataCell(
                  Row(
                    children: [
                      Checkbox(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        value: data.isSelected,
                        onChanged: (selected) {
                          setState(() {
                            data.isSelected = selected ?? false;
                            _selectAll =
                                Registrations.every((d) => d.isSelected);
                          });
                        },
                      ),
                      const SizedBox(width: 12.0),
                      //Text(data.id.toString())
                    ],
                  ),
                ),
                DataCell(
                  Text(data.fullName ?? ''),
                ),
                DataCell(
                  PopupMenuButton<String>(
                    iconColor: theme.colorScheme.onTertiary,
                    color: theme.colorScheme.primaryContainer,
                    onSelected: (action) {
                      switch (action) {
                        case 'Edit':
                          /* ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${lang.edit} ${data.name}'),
                            ),
                          ); */
                          _showEditFormDialog(data);
                          break;
                        case 'View':
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('${lang.viewed} ${data.fullName}')),
                          );
                          break;
                        case 'Delete':
                          setState(() {
                            Registrations.remove(data);
                            _filteredData.remove(data);
                          });
                          break;
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem<String>(
                          value: 'Edit',
                          child: Text(
                            lang.edit,
                            //'Edit',
                            style: textTheme.bodyMedium,
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'View',
                          child: Text(lang.view,
                              // 'View',
                              style: textTheme.bodyMedium),
                        ),
                        PopupMenuItem<String>(
                          value: 'Delete',
                          child: Text(lang.delete,
                              // 'Delete',
                              style: textTheme.bodyMedium),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  ///_____________________________________________________________________Selected_datatable_________________________
  void _selectAllRows(bool select) {
    setState(() {
      for (var data in registrations) {
        data.isSelected = select;
      }
      _selectAll = select;
    });
  }
}

class _SizeInfo {
  final double? alertFontSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.alertFontSize = 18,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}
