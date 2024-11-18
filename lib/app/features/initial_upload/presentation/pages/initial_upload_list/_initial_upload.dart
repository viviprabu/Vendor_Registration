// 🎯 Dart imports:

// 🐦 Flutter imports:
import 'package:file_picker/file_picker.dart';
import 'package:finance_app/app/core/helpers/field_styles/_input_field_styles.dart';
import 'package:finance_app/app/core/static/_static_values.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_bloc.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_event.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_state.dart';
import 'package:finance_app/app/widgets/company_header/_company_header.dart';
import 'package:finance_app/app/widgets/textfield_wrapper/_textfield_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// 📦 Package imports:
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
// 🌎 Project imports:
import 'package:finance_app/app/widgets/shadow_container/_shadow_container.dart';
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class InitialUploadPage extends StatefulWidget {
  const InitialUploadPage({super.key});

  @override
  _InitialUploadPageState createState() => _InitialUploadPageState();
}

class _InitialUploadPageState extends State<InitialUploadPage> {
  ///_____________________________________________________________________Variables_______________________________
  late List<InitialUpload> _filteredData;
  final ScrollController _scrollController = ScrollController();
  List<InitialUpload> initialUpload = [];
  int _currentPage = 0;
  int _rowsPerPage = 10;
  String _searchQuery = '';
  bool _selectAll = false;
  final _uploadController = TextEditingController();
  final _dateController = TextEditingController();

  final int startYear = AppDateConfig.beginYear;
  final int endYear = AppDateConfig.endYear;
  late final Function(int) onYearSelected;

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(initialUpload);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final uploadCreationFormKey = GlobalKey<FormState>();

  List<Map<int, String>> get _language => [
        {1: 'English'},
        {2: 'Arabic'},
      ];

  List<Map<int, String>> get _businessRole => [
        {1: 'admin'},
        {2: 'user'},
      ];

  List<Map<int, String>> get _userRoles => [
        {1: 'admin'},
        {2: 'user'},
      ];

  String? savedFilePath;
  final String _fileName = '';

  String? fileName;

  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.first.name;
        _uploadController.text = fileName.toString(); // Get the file name
      });
      print(result.files);
    }
  }

  ///_____________________________________________________________________data__________________________________
  /* List<UserDataModel> get _currentPageData {
    if (_searchQuery.isNotEmpty) {
      _filteredData = InitialUpload
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
      _filteredData = List.from(InitialUpload);
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
  // void _showFormDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(
  //           sigmaX: 5,
  //           sigmaY: 5,
  //         ),
  //         child: const AddInitialUploadDialog(),
  //       );
  //     },
  //   );
  // }

  ///_____________________________________________________________________Edit User Dialog_________________________________

  // void _showEditFormDialog(InitialUpload initialUploadData) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(
  //           sigmaX: 5,
  //           sigmaY: 5,
  //         ),
  //         child: EditInitialUploadDialog(
  //           initialUploadData: initialUploadData,
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final inputFieldStyle = FinanceInputFieldStyles(context);
    final lang = l.S.of(context);
    context.read<InitialUploadBloc>().add(InitialUploadsListEvent());
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
    return BlocBuilder<InitialUploadBloc, InitialUploadState>(
      builder: (context, state) {
        if (state is InitialUploadsListState) {
          initialUpload = state.initialUploads;
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
                    final isTablet = constraints.maxWidth < 992 &&
                        constraints.maxWidth >= 481;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //______________________________________________________________________Header__________________
                        // isMobile
                        //     ? Padding(
                        //         padding: sizeInfo.padding,
                        //         child: Column(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Row(
                        //               crossAxisAlignment:
                        //                   CrossAxisAlignment.start,
                        //               children: [
                        //                 Expanded(
                        //                   flex: 2,
                        //                   child: showingValueDropDown(
                        //                       isTablet: isTablet,
                        //                       isMobile: isMobile,
                        //                       textTheme: textTheme),
                        //                 ),
                        //                 // const Spacer(),
                        //                 // addInitialUploadButton(textTheme),
                        //               ],
                        //             ),
                        //             const SizedBox(height: 16.0),
                        //             searchFormField(textTheme: textTheme),
                        //           ],
                        //         ),
                        //       )
                        //     : Padding(
                        //         padding: sizeInfo.padding,
                        //         child: Row(
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Expanded(
                        //               flex: 1,
                        //               child: showingValueDropDown(
                        //                 isTablet: isTablet,
                        //                 isMobile: isMobile,
                        //                 textTheme: textTheme,
                        //               ),
                        //             ),
                        //             const SizedBox(width: 16.0),
                        //             Expanded(
                        //               flex: isTablet || isMobile ? 2 : 3,
                        //               child: Column(
                        //                 children: [
                        //                   searchFormField(textTheme: textTheme),
                        //                 ],
                        //               ),
                        //             ),
                        //             // Spacer(
                        //             //     flex: isTablet || isMobile ? 1 : 2),
                        //             // addInitialUploadButton(textTheme),
                        //           ],
                        //         ),
                        //       ),
                        const SizedBox(height: 24),

                        //______________________________________________________________________Data_table__________________
                        isMobile || isTablet
                            ? RawScrollbar(
                                padding: const EdgeInsets.only(left: 18),
                                trackBorderColor: theme.colorScheme.surface,
                                trackVisibility: true,
                                scrollbarOrientation:
                                    ScrollbarOrientation.bottom,
                                controller: _scrollController,
                                thumbVisibility: true,
                                thickness: 8.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // controller: _scrollController,
                                      // scrollDirection: Axis.horizontal,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          minWidth: constraints.maxWidth,
                                        ),
                                        child: Form(
                                          key: uploadCreationFormKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ///---------------- header section
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.0, 0, 16, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // const Text('Form Dialog'),
                                                    Text(
                                                      lang.addNewInitialUpload,
                                                      style:
                                                          textTheme.bodyMedium,
                                                    ),
                                                    const SizedBox(
                                                      height: 16,
                                                    ),
                                                    // IconButton(
                                                    //   onPressed: () =>
                                                    //       Navigator.pop(context),
                                                    //   icon: const Icon(
                                                    //     Icons.close,
                                                    //     color:
                                                    //         FinanceAppColors.kError,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1,
                                                color:
                                                    theme.colorScheme.outline,
                                                height: 0,
                                              ),

                                              ///---------------- header section
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: SizedBox(
                                                  // width: MediaQuery.of(context)
                                                  //         .size
                                                  //         .width *
                                                  //     0.80,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                          height: 16),

                                                      ///---------------- Text Field section

                                                      Row(
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              child:
                                                                  TextFieldLabelWrapper(
                                                                //labelText: 'Input Date',
                                                                labelText: lang
                                                                    .selectYear,
                                                                labelStyle:
                                                                    textTheme
                                                                        .bodySmall,
                                                                inputField:
                                                                    TextFormField(
                                                                        controller:
                                                                            _dateController,
                                                                        keyboardType:
                                                                            TextInputType
                                                                                .visiblePassword,
                                                                        readOnly:
                                                                            true,
                                                                        selectionControls:
                                                                            EmptyTextSelectionControls(),
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              'mm/dd/yyyy',
                                                                          suffixIcon: const Icon(
                                                                              IconlyLight.calendar,
                                                                              size: 20),
                                                                          suffixIconConstraints:
                                                                              inputFieldStyle.iconConstraints,
                                                                        ),
                                                                        onTap:
                                                                            () async {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: AlertDialog(
                                                                                  title: Text("Year"),
                                                                                  content: SizedBox(
                                                                                    width: 300,
                                                                                    height: 300,
                                                                                    child: GridView.builder(
                                                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                                                                                      itemCount: endYear - startYear + 1,
                                                                                      itemBuilder: (context, index) {
                                                                                        final year = startYear + index;
                                                                                        return GestureDetector(
                                                                                          onTap: () => onYearSelected(year),
                                                                                          child: InkWell(
                                                                                            hoverColor: const Color.fromARGB(255, 7, 22, 240),
                                                                                            onTap: () {
                                                                                              _dateController.text = year.toString();
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            child: Card(
                                                                                              color: Colors.blue[100],
                                                                                              child: Center(
                                                                                                  child: Text(
                                                                                                year.toString(),
                                                                                                style: textTheme.bodySmall,
                                                                                              )),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        Navigator.of(context).pop(); // Closes the dialog
                                                                                      },
                                                                                      child: Text("Cancel"),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () {
                                                                                        // Perform some action
                                                                                        Navigator.of(context).pop(); // Closes the dialog
                                                                                      },
                                                                                      child: Text("OK"),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        }),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              child:
                                                                  TextFieldLabelWrapper(
                                                                labelText:
                                                                    lang.upload,
                                                                labelStyle:
                                                                    textTheme
                                                                        .bodySmall,
                                                                inputField:
                                                                    TextFormField(
                                                                  decoration:
                                                                      InputDecoration(
                                                                    //hintText: 'Document Name',
                                                                    hintText: lang
                                                                        .pleaseUploadAnyFile,

                                                                    suffixIcon:
                                                                        Container(
                                                                      margin: const EdgeInsetsDirectional
                                                                          .all(
                                                                          5),
                                                                      child: ElevatedButton
                                                                          .icon(
                                                                        icon: Icon(
                                                                            Icons.select_all_rounded),
                                                                        onPressed:
                                                                            () {
                                                                          uploadFile();
                                                                        },
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          padding:
                                                                              const EdgeInsetsDirectional.symmetric(
                                                                            horizontal:
                                                                                24,
                                                                          ),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4),
                                                                          ),
                                                                          visualDensity:
                                                                              const VisualDensity(vertical: -4),
                                                                        ),
                                                                        // child: const Text('Save'),
                                                                        label: Text(
                                                                            lang.select),
                                                                        // child: Text(
                                                                        //     lang.select),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                          height: 20),

                                                      ///---------------- Submit Button section
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: sizeInfo
                                                                .innerSpacing),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                                width: sizeInfo
                                                                    .innerSpacing),
                                                            ElevatedButton.icon(
                                                              icon: Icon(Icons
                                                                  .upload_file_rounded),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        sizeInfo
                                                                            .innerSpacing),
                                                              ),
                                                              onPressed: () {
                                                                context.go(
                                                                    '/uploads/uploads_list');
                                                                // uploadFile();
                                                              },
                                                              //label: const Text('Save'),
                                                              label: Text(
                                                                  lang.upload),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: sizeInfo.padding,
                                      child: Text(''),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                // controller: _scrollController,
                                // scrollDirection: Axis.horizontal,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: constraints.maxWidth,
                                  ),
                                  child: Form(
                                    key: uploadCreationFormKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///---------------- header section
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              16.0, 0, 16, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // const Text('Form Dialog'),
                                              Text(lang.addNewInitialUpload),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: theme.colorScheme.outline,
                                          height: 0,
                                        ),

                                        ///---------------- header section
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.80,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 16),

                                                ///---------------- Text Field section

                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child:
                                                            TextFieldLabelWrapper(
                                                          //labelText: 'Input Date',
                                                          labelText:
                                                              lang.selectYear,
                                                          labelStyle: textTheme
                                                              .bodySmall,
                                                          inputField:
                                                              TextFormField(
                                                            controller:
                                                                _dateController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .visiblePassword,
                                                            readOnly: true,
                                                            selectionControls:
                                                                EmptyTextSelectionControls(),
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: 'Year',
                                                              suffixIcon: const Icon(
                                                                  IconlyLight
                                                                      .calendar,
                                                                  size: 20),
                                                              suffixIconConstraints:
                                                                  inputFieldStyle
                                                                      .iconConstraints,
                                                            ),
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            8.0),
                                                                    child:
                                                                        AlertDialog(
                                                                      title: Text(
                                                                          "Year"),
                                                                      content:
                                                                          SizedBox(
                                                                        width:
                                                                            300,
                                                                        height:
                                                                            300,
                                                                        child: GridView
                                                                            .builder(
                                                                          gridDelegate:
                                                                              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                                                                          itemCount: endYear -
                                                                              startYear +
                                                                              1,
                                                                          itemBuilder:
                                                                              (context, index) {
                                                                            final year =
                                                                                startYear + index;
                                                                            return GestureDetector(
                                                                              onTap: () => onYearSelected(year),
                                                                              child: InkWell(
                                                                                hoverColor: const Color.fromARGB(255, 7, 22, 240),
                                                                                onTap: () {
                                                                                  _dateController.text = year.toString();
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Card(
                                                                                  color: Colors.blue[100],
                                                                                  child: Center(
                                                                                      child: Text(
                                                                                    year.toString(),
                                                                                    style: textTheme.bodySmall,
                                                                                  )),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop(); // Closes the dialog
                                                                          },
                                                                          child:
                                                                              Text("Cancel"),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            // Perform some action
                                                                            Navigator.of(context).pop(); // Closes the dialog
                                                                          },
                                                                          child:
                                                                              Text("OK"),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                              //     await showDatePicker(
                                                              //   initialDatePickerMode:
                                                              //       DatePickerMode
                                                              //           .year,
                                                              //   context:
                                                              //       context,
                                                              //   firstDate:
                                                              //       AppDateConfig
                                                              //           .appFirstDate,
                                                              //   lastDate:
                                                              //       AppDateConfig
                                                              //           .appLastDate,
                                                              //   initialDate:
                                                              //       DateTime
                                                              //           .now(),
                                                              //   builder: (context,
                                                              //           child) =>
                                                              //       Theme(
                                                              //     data: theme
                                                              //         .copyWith(
                                                              //       datePickerTheme:
                                                              //           DatePickerThemeData(
                                                              //         shape:
                                                              //             RoundedRectangleBorder(
                                                              //           borderRadius:
                                                              //               BorderRadius.circular(4),
                                                              //         ),
                                                              //       ),
                                                              //     ),
                                                              //     child: child!,
                                                              //   ),
                                                              // );

                                                              // setState(() => )
                                                              // _dateController.text =                                                                  result
                                                              //         .toString();
                                                              // // .text = DateFormat(
                                                              //     AppDateConfig
                                                              //         .appNumberOnlyDateFormat)
                                                              // .format(
                                                              //     result);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        child:
                                                            TextFieldLabelWrapper(
                                                          labelText:
                                                              lang.upload,
                                                          labelStyle: textTheme
                                                              .bodySmall,
                                                          inputField:
                                                              TextFormField(
                                                            controller:
                                                                _uploadController,
                                                            decoration:
                                                                InputDecoration(
                                                              //hintText: 'Document Name',
                                                              hintText: lang
                                                                  .pleaseUploadAnyFile,

                                                              suffixIcon:
                                                                  Container(
                                                                margin:
                                                                    const EdgeInsetsDirectional
                                                                        .all(5),
                                                                child:
                                                                    ElevatedButton
                                                                        .icon(
                                                                  icon: Icon(Icons
                                                                      .select_all_rounded),
                                                                  onPressed:
                                                                      () {
                                                                    uploadFile();
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    padding:
                                                                        const EdgeInsetsDirectional
                                                                            .symmetric(
                                                                      horizontal:
                                                                          24,
                                                                    ),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    visualDensity:
                                                                        const VisualDensity(
                                                                            vertical:
                                                                                -4),
                                                                  ),
                                                                  // child: const Text('Save'),
                                                                  label: Text(lang
                                                                      .select),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(height: 20),

                                                ///---------------- Submit Button section
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: sizeInfo
                                                          .innerSpacing),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                          width: sizeInfo
                                                              .innerSpacing),
                                                      ElevatedButton.icon(
                                                        icon: Icon(Icons
                                                            .upload_file_rounded),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      sizeInfo
                                                                          .innerSpacing),
                                                        ),
                                                        onPressed: () {
                                                          context.go(
                                                              '/uploads/uploads_list');
                                                          // uploadFile();
                                                        },
                                                        //label: const Text('Save'),
                                                        label:
                                                            Text(lang.upload),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                        //______________________________________________________________________footer__________________
                        // isTablet || isMobile
                        //     ? const SizedBox.shrink()
                        //     : Padding(
                        //         padding: sizeInfo.padding,
                        //         child: paginatedSection(theme, textTheme),
                        //       ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );

        // if (state is SettingLoadingState) {
        //   return Center(child: CircularProgressIndicator());
        // }

        // return Center(child: Text('Failed to load data.'));
      },
    );
  }

  ///_____________________________________________________________________add_user_button___________________________
  // ElevatedButton addInitialUploadButton(TextTheme textTheme) {
  //   final lang = l.S.of(context);
  //   return ElevatedButton.icon(
  //     style: ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
  //     ),
  //     onPressed: () {
  //       setState(() {
  //         _showFormDialog(context);
  //       });
  //     },
  //     label: Text(
  //       lang.addNewUser,
  //       //'Add New User',
  //       style: textTheme.bodySmall?.copyWith(
  //         color: FinanceAppColors.kWhiteColor,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     iconAlignment: IconAlignment.start,
  //     icon: const Icon(
  //       Icons.add_circle_outline_outlined,
  //       color: FinanceAppColors.kWhiteColor,
  //       size: 20.0,
  //     ),
  //   );
  // }

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
            '${l.S.of(context).showing} ${_currentPage * _rowsPerPage + 1} ${l.S.of(context).to} ${_currentPage * _rowsPerPage + initialUpload.length} ${l.S.of(context).OF} ${_filteredData.length} ${l.S.of(context).entries}',
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
  Theme initialUploadListDataTable(
      BuildContext context, List<InitialUpload> initialUpload) {
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
          DataColumn(label: Text(lang.userName)),
          DataColumn(label: Text(lang.status)),
          DataColumn(label: Text(lang.actions)),
        ],
        rows: initialUpload.map(
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
                                initialUpload.every((d) => d.isSelected);
                          });
                        },
                      ),
                      const SizedBox(width: 12.0),
                      //Text(data.id.toString())
                    ],
                  ),
                ),
                DataCell(
                  Text(data.name ?? ''),
                ),
                DataCell(Row(
                  children: [
                    /* Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AvatarWidget(
                          fit: BoxFit.cover,
                          avatarShape: AvatarShape.circle,
                          size: const Size(40, 40),
                          imagePath: data.),
                    ), */
                    const SizedBox(width: 8.0),
                    Text(data.id ?? ''),
                  ],
                )),
                DataCell(Text(data.name ?? '')),
                // DataCell(
                //   Container(
                //     padding:
                //         const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                //     decoration: BoxDecoration(
                //       color: data.isActive == true
                //           ? FinanceAppColors.kSuccess.withOpacity(0.2)
                //           : FinanceAppColors.kError.withOpacity(0.2),
                //       borderRadius: BorderRadius.circular(16.0),
                //     ),
                //     child: Text(
                //       data.isActive == true ? lang.active : lang.inactive,
                //       style: textTheme.bodySmall?.copyWith(
                //           color: data.isActive == true
                //               ? FinanceAppColors.kSuccess
                //               : FinanceAppColors.kError),
                //     ),
                //   ),
                // ),
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
                          // _showEditFormDialog(data);
                          break;
                        case 'View':
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('${lang.viewed} ${data.name}')),
                          );
                          break;
                        case 'Delete':
                          setState(() {
                            initialUpload.remove(data);
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
      for (var data in initialUpload) {
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
