// 🐦 Flutter imports:

import 'package:file_picker/file_picker.dart';
import 'package:finance_app/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:finance_app/app/core/helpers/field_styles/_input_field_styles.dart';
import 'package:finance_app/app/core/static/_static_values.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_create.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_bloc.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_event.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_state.dart';
import 'package:finance_app/app/features/section/presentation/bloc/section_bloc.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/widgets/shadow_container/_shadow_container.dart';
import 'package:finance_app/app/widgets/textfield_wrapper/_textfield_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../generated/l10n.dart' as l;

// 📦 Package imports:
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({super.key});

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  // Field State Props
  final bool _obscureText = true;
  final _requestNumberController = TextEditingController();
  final _requestDateController = TextEditingController();
  final _estimatedAmountController = TextEditingController();
  final _dateFromController = TextEditingController();
  final _dateToController = TextEditingController();
  final _cdRepContactController = TextEditingController();
  final _subjectController = TextEditingController();
  final _listOfCdController = TextEditingController();
  final _documentFeesController = TextEditingController();
  final _uploadController = TextEditingController();
  final _stateController = TextEditingController();
  final _nextStepController = TextEditingController();

  final int startYear = AppDateConfig.beginYear;
  final int endYear = AppDateConfig.endYear;
  late final Function(int) onYearSelected;

  late List<Sector> sector = [];
  late List<Department> departments = [];
  late List<Department> sectorDepartments = [];
  String? selectedSectorId;
  String? selectedDeptId;
  String? selectedSectionId;
  String? selectedLanguageId;

  @override
  void initState() {
    context.read<SectorBloc>().add(SectorsListEvent());
    super.initState();
  }

  @override
  void dispose() {
    _uploadController.dispose();
    super.dispose();
  }

  String? savedFilePath;
  String? fileName;

  Future<void> RequestFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.first.name;
        _uploadController.text = fileName.toString(); // Get the file name
      });
      print(result.files);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final lang = l.S.of(context);

    final dropdownStyle = FinanceDropdownStyle(context);
    final inputFieldStyle = FinanceInputFieldStyles(context);
    const lg = 4;
    const md = 6;

    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 992,
          value: _SizeInfo(
            fonstSize: 12,
            padding: EdgeInsetsDirectional.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;

    return BlocListener<InitialRequestBloc, InitialRequestState>(
      listener: (context, state) {
        if (state is InitialRequestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }

        if (state is InitialRequestCreateState) {
          if (state.initialRequest.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Request Created Successfully'),
              ),
            );
            // refresh the user list
            context.read<InitialRequestBloc>().add(InitialRequestsListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Request Creation Failed'),
              ),
            );
          }
        }
        // TODO: implement listener
      },
      child: Scaffold(
        body: ListView(
          padding: sizeInfo.padding,
          children: [
            // Input Example
            ShadowContainer(
              // headerText: 'Input Example',
              headerText: lang.request,
              child: ResponsiveGridRow(
                children: [
                  ...{
                    //"Basic Input": null,
                    // lang.basicInput: null,
                    // //  "Input with Placeholder": "Placeholder",
                    // lang.inputWithPlaceholder: lang.placeholder,
                    // // "Input with Value": "Input Value",
                    // lang.inputWithValue: lang.inputValue,
                  }.entries.map(
                        (prop) => ResponsiveGridCol(
                          lg: lg,
                          md: md,
                          child: Padding(
                            padding: EdgeInsetsDirectional.all(
                                sizeInfo.innerSpacing / 2),
                            child: TextFieldLabelWrapper(
                              labelText: prop.key,
                              inputField: TextFormField(
                                decoration:
                                    InputDecoration(hintText: prop.value),
                              ),
                            ),
                          ),
                        ),
                      ),

                  // Dropdown Widget
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input with Icon',
                        labelText: lang.requestNumber,
                        inputField: TextFormField(
                          controller: _requestNumberController,
                          decoration: InputDecoration(
                            //hintText: 'Input with Icon',
                            hintText: lang.requestNumber,
                            prefixIcon: const Icon(
                              IconlyLight.document,
                              size: 20,
                            ),
                            prefixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input Date',
                        labelText: lang.requestDate,
                        inputField: TextFormField(
                          controller: _requestDateController,
                          keyboardType: TextInputType.visiblePassword,
                          readOnly: true,
                          selectionControls: EmptyTextSelectionControls(),
                          decoration: InputDecoration(
                            hintText: 'dd/mm/yyyy',
                            suffixIcon:
                                const Icon(IconlyLight.calendar, size: 20),
                            suffixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                          onTap: () async {
                            final result = await showDatePicker(
                              context: context,
                              firstDate: AppDateConfig.appFirstDate,
                              lastDate: AppDateConfig.appLastDate,
                              initialDate: DateTime.now(),
                              builder: (context, child) => Theme(
                                data: theme.copyWith(
                                  datePickerTheme: DatePickerThemeData(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                child: child!,
                              ),
                            );

                            if (result != null) {
                              // setState(() => )
                              _requestDateController.text = DateFormat(
                                      AppDateConfig.appNumberOnlyDateFormat)
                                  .format(result);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input with Icon',
                        labelText: lang.estimatedAmount,
                        inputField: TextFormField(
                          controller: _estimatedAmountController,
                          decoration: InputDecoration(
                            //hintText: 'Input with Icon',
                            hintText: lang.estimatedAmount,
                            prefixIcon: const Icon(
                              IconlyLight.bag,
                              size: 20,
                            ),
                            prefixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                          // labelText: 'Email',
                          labelText: lang.sector,
                          inputField: BlocBuilder<SectorBloc, SectorState>(
                              builder: (context, state) {
                            if (state is SectorsListState) {
                              sector = state.sectors;
                            }
                            return DropdownButtonFormField<String>(
                              value: selectedSectorId,
                              hint: Text('Select any sector'),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedSectorId = newValue;
                                  selectedDeptId = null;
                                });
                                context
                                    .read<DepartmentBloc>()
                                    .add(DepartmentsListEvent());
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'This field cannot be left empty';
                                }
                                return null;
                              },
                              // items: [],

                              items: sector
                                  .map<DropdownMenuItem<String>>((sectorValue) {
                                return DropdownMenuItem<String>(
                                    value: sectorValue.id.toString(),
                                    child: Text(sectorValue.name.toString()));
                              }).toList(),
                            );
                          })),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                          // labelText: 'Email',
                          labelText: lang.department,
                          inputField:
                              BlocBuilder<DepartmentBloc, DepartmentState>(
                                  builder: (dContext, dState) {
                            if (dState is DepartmentsListState) {
                              departments = dState.departments;
                              sectorDepartments = departments
                                  .where((element) =>
                                      element.sectorId.toString() ==
                                      selectedSectorId)
                                  .toList();
                            }

                            return DropdownButtonFormField<String>(
                              value: selectedDeptId,
                              hint: Text('Select any department'),
                              onChanged: (deptValue) {
                                setState(() {
                                  selectedDeptId = deptValue;
                                  selectedSectionId = null;
                                });
                                context
                                    .read<SectionBloc>()
                                    .add(SectionsListEvent());
                              },
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return 'This field cannot be left empty';
                                }
                                return null;
                              },
                              items: sectorDepartments
                                  .map<DropdownMenuItem<String>>((depValue) {
                                return DropdownMenuItem<String>(
                                    value: depValue.id.toString(),
                                    child: Text(depValue.name.toString()));
                              }).toList(),
                            );
                          })),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input with Icon',
                        labelText: lang.documentFees,
                        inputField: TextFormField(
                          controller: _documentFeesController,
                          decoration: InputDecoration(
                            //hintText: 'Input with Icon',
                            hintText: lang.documentFees,
                            prefixIcon: const Icon(
                              IconlyLight.document,
                              size: 20,
                            ),
                            prefixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Disabled Input

                  // Input With Icon

                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input Date',
                        labelText: lang.yearFrom,
                        inputField: TextFormField(
                            controller: _dateFromController,
                            keyboardType: TextInputType.visiblePassword,
                            readOnly: true,
                            selectionControls: EmptyTextSelectionControls(),
                            decoration: InputDecoration(
                              hintText: 'mm/dd/yyyy',
                              suffixIcon:
                                  const Icon(IconlyLight.calendar, size: 20),
                              suffixIconConstraints:
                                  inputFieldStyle.iconConstraints,
                            ),
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AlertDialog(
                                      title: Text("Year"),
                                      content: SizedBox(
                                        width: 300,
                                        height: 300,
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5),
                                          itemCount: endYear - startYear + 1,
                                          itemBuilder: (context, index) {
                                            final year = startYear + index;
                                            return GestureDetector(
                                              onTap: () => onYearSelected(year),
                                              child: InkWell(
                                                hoverColor:
                                                    const Color.fromARGB(
                                                        255, 7, 22, 240),
                                                onTap: () {
                                                  _dateFromController.text =
                                                      year.toString();
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
                                            Navigator.of(context)
                                                .pop(); // Closes the dialog
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Perform some action
                                            Navigator.of(context)
                                                .pop(); // Closes the dialog
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                        // inputField: TextFormField(
                        //   controller: _dateFromController,
                        //   keyboardType: TextInputType.visiblePassword,
                        //   readOnly: true,
                        //   selectionControls: EmptyTextSelectionControls(),
                        //   decoration: InputDecoration(
                        //     hintText: 'dd/mm/yyyy',
                        //     suffixIcon:
                        //         const Icon(IconlyLight.calendar, size: 20),
                        //     suffixIconConstraints:
                        //         inputFieldStyle.iconConstraints,
                        //   ),
                        //   onTap: () async {
                        //     final result = await showDatePicker(
                        //       context: context,
                        //       firstDate: AppDateConfig.appFirstDate,
                        //       lastDate: AppDateConfig.appLastDate,
                        //       initialDate: DateTime.now(),
                        //       builder: (context, child) => Theme(
                        //         data: theme.copyWith(
                        //           datePickerTheme: DatePickerThemeData(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(4),
                        //             ),
                        //           ),
                        //         ),
                        //         child: child!,
                        //       ),
                        //     );

                        //     if (result != null) {
                        //       // setState(() => )
                        //       _dateFromController.text = DateFormat(
                        //               AppDateConfig.appNumberOnlyDateFormat)
                        //           .format(result);
                        //     }
                        //   },
                        // ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input Date',
                        labelText: lang.yearTo,
                        inputField: TextFormField(
                            controller: _dateToController,
                            keyboardType: TextInputType.visiblePassword,
                            readOnly: true,
                            selectionControls: EmptyTextSelectionControls(),
                            decoration: InputDecoration(
                              hintText: 'mm/dd/yyyy',
                              suffixIcon:
                                  const Icon(IconlyLight.calendar, size: 20),
                              suffixIconConstraints:
                                  inputFieldStyle.iconConstraints,
                            ),
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AlertDialog(
                                      title: Text("Year"),
                                      content: SizedBox(
                                        width: 300,
                                        height: 300,
                                        child: GridView.builder(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5),
                                          itemCount: endYear - startYear + 1,
                                          itemBuilder: (context, index) {
                                            final year = startYear + index;
                                            return GestureDetector(
                                              onTap: () => onYearSelected(year),
                                              child: InkWell(
                                                hoverColor:
                                                    const Color.fromARGB(
                                                        255, 7, 22, 240),
                                                onTap: () {
                                                  _dateToController.text =
                                                      year.toString();
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
                                            Navigator.of(context)
                                                .pop(); // Closes the dialog
                                          },
                                          child: Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // Perform some action
                                            Navigator.of(context)
                                                .pop(); // Closes the dialog
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                        // inputField: TextFormField(
                        //   controller: _dateToController,
                        //   keyboardType: TextInputType.visiblePassword,
                        //   readOnly: true,
                        //   selectionControls: EmptyTextSelectionControls(),
                        //   decoration: InputDecoration(
                        //     hintText: 'dd/mm/yyyy',
                        //     suffixIcon:
                        //         const Icon(IconlyLight.calendar, size: 20),
                        //     suffixIconConstraints:
                        //         inputFieldStyle.iconConstraints,
                        //   ),
                        //   onTap: () async {
                        //     final result = await showDatePicker(
                        //       context: context,
                        //       firstDate: AppDateConfig.appFirstDate,
                        //       lastDate: AppDateConfig.appLastDate,
                        //       initialDate: DateTime.now(),
                        //       builder: (context, child) => Theme(
                        //         data: theme.copyWith(
                        //           datePickerTheme: DatePickerThemeData(
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(4),
                        //             ),
                        //           ),
                        //         ),
                        //         child: child!,
                        //       ),
                        //     );

                        //     if (result != null) {
                        //       // setState(() => )
                        //       _dateToController.text = DateFormat(
                        //               AppDateConfig.appNumberOnlyDateFormat)
                        //           .format(result);
                        //     }
                        //   },
                        // ),
                      ),
                    ),
                  ),

                  // Input with Icon Right
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input with Icon',
                        labelText: lang.cdRepContact,
                        inputField: TextFormField(
                          controller: _cdRepContactController,
                          decoration: InputDecoration(
                            //hintText: 'Input with Icon',
                            hintText: lang.cdRepContact,
                            prefixIcon: const Icon(
                              IconlyLight.calling,
                              size: 20,
                            ),
                            prefixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input with Icon',
                        labelText: lang.subject,
                        inputField: TextFormField(
                          controller: _subjectController,
                          decoration: InputDecoration(
                            //hintText: 'Input with Icon',
                            hintText: lang.subject,
                            prefixIcon: const Icon(
                              IconlyLight.bookmark,
                              size: 20,
                            ),
                            prefixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Input with Icon',
                        labelText: lang.comments,
                        inputField: TextFormField(
                          controller: _listOfCdController,
                          decoration: InputDecoration(
                            //hintText: 'Input with Icon',
                            hintText: lang.comments,
                            prefixIcon: const Icon(
                              IconlyLight.upload,
                              size: 20,
                            ),
                            prefixIconConstraints:
                                inputFieldStyle.iconConstraints,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //  Password Field
                  //     ResponsiveGridCol(
                  //       lg: lg,
                  //       md: md,
                  //       child: Padding(
                  //         padding:
                  //             EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                  //         child: StatefulBuilder(
                  //           builder: (context, setState) {
                  //             return TextFieldLabelWrapper(
                  //               //labelText: 'Input Password',
                  //               labelText: lang.inputPassword,
                  //               inputField: TextFormField(
                  //                 keyboardType: TextInputType.visiblePassword,
                  //                 obscureText: _obscureText,
                  //                 obscuringCharacter: '*',
                  //                 decoration: InputDecoration(
                  //                   // hintText: 'Input Password',
                  //                   hintText: lang.inputPassword,
                  //                   suffixIcon: IconButton(
                  //                     onPressed: () => setState(
                  //                       () => _obscureText = !_obscureText,
                  //                     ),
                  //                     padding: EdgeInsetsDirectional.zero,
                  //                     visualDensity: const VisualDensity(
                  //                       horizontal: -4,
                  //                       vertical: -4,
                  //                     ),
                  //                     icon: Icon(
                  //                       _obscureText
                  //                           ? FeatherIcons.eye
                  //                           : FeatherIcons.eyeOff,
                  //                       size: 20,
                  //                     ),
                  //                   ),
                  //                   suffixIconConstraints:
                  //                       inputFieldStyle.iconConstraints,
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         ),
                  //       ),
                  //     ),

                  //     //  Date Input Field
                  //     ResponsiveGridCol(
                  //       lg: lg,
                  //       md: md,
                  //       child: Padding(
                  //         padding:
                  //             EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                  //         child: TextFieldLabelWrapper(
                  //           //labelText: 'Input Date',
                  //           labelText: lang.inputDate,
                  //           inputField: TextFormField(
                  //             controller: _dateController,
                  //             keyboardType: TextInputType.visiblePassword,
                  //             readOnly: true,
                  //             selectionControls: EmptyTextSelectionControls(),
                  //             decoration: InputDecoration(
                  //               hintText: 'yyyy',
                  //               suffixIcon:
                  //                   const Icon(IconlyLight.calendar, size: 20),
                  //               suffixIconConstraints:
                  //                   inputFieldStyle.iconConstraints,
                  //             ),
                  //             onTap: () async {
                  //               final result = await showDatePicker(
                  //                 context: context,
                  //                 firstDate: AppDateConfig.appFirstDate,
                  //                 lastDate: AppDateConfig.appLastDate,
                  //                 initialDate: DateTime.now(),
                  //                 builder: (context, child) => Theme(
                  //                   data: theme.copyWith(
                  //                     datePickerTheme: DatePickerThemeData(
                  //                       shape: RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.circular(4),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   child: child!,
                  //                 ),
                  //               );

                  //               if (result != null) {
                  //                 // setState(() => )
                  //                 _dateController.text = DateFormat(
                  //                         AppDateConfig.appNumberOnlyDateFormat)
                  //                     .format(result);
                  //               }
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                  //     // Rounded Input
                  //     ResponsiveGridCol(
                  //       lg: lg,
                  //       md: md,
                  //       child: Padding(
                  //         padding:
                  //             EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                  //         child: TextFieldLabelWrapper(
                  //           //labelText: 'Rounded Input',
                  //           labelText: lang.roundedInput,
                  //           inputField: TextFormField(
                  //             enabled: false,
                  //             decoration: InputDecoration(
                  //               //hintText: 'Rounded Input',
                  //               hintText: lang.roundedInput,
                  //               border: inputFieldStyle.getRoundedBorder(),
                  //               enabledBorder: inputFieldStyle.getRoundedBorder(
                  //                 getRoundedBorderType:
                  //                     RoundedBorderType.enabledBorder,
                  //               ),
                  //               focusedBorder: inputFieldStyle.getRoundedBorder(
                  //                 getRoundedBorderType:
                  //                     RoundedBorderType.focusedBorder,
                  //               ),
                  //               errorBorder: inputFieldStyle.getRoundedBorder(
                  //                 getRoundedBorderType: RoundedBorderType.errorBorder,
                  //               ),
                  //               focusedErrorBorder: inputFieldStyle.getRoundedBorder(
                  //                 getRoundedBorderType:
                  //                     RoundedBorderType.focusedErrorBorder,
                  //               ),
                  //               disabledBorder: inputFieldStyle.getRoundedBorder(
                  //                 getRoundedBorderType:
                  //                     RoundedBorderType.disabledBorder,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                  //     // Input Border Style
                  //     ResponsiveGridCol(
                  //       lg: lg,
                  //       md: md,
                  //       child: Padding(
                  //         padding:
                  //             EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                  //         child: TextFieldLabelWrapper(
                  //           //labelText: 'Input Border Style',
                  //           labelText: lang.inputBorderStyle,
                  //           inputField: TextFormField(
                  //             decoration: InputDecoration(
                  //               // TODO: Fix Dashed Border Later
                  //               //hintText: 'Input Border Style',
                  //               hintText: lang.inputBorderStyle,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                  //     // Example Textarea
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: lang.fileUpload,
                        inputField: TextFormField(
                          controller: _uploadController,
                          decoration: InputDecoration(
                            //hintText: 'Document Name',
                            hintText: lang.pleaseUploadAnyFile,

                            suffixIcon: Container(
                              margin: const EdgeInsetsDirectional.all(5),
                              child: ElevatedButton.icon(
                                icon: Icon(
                                  Icons.select_all_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  RequestFile();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                    horizontal: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  visualDensity:
                                      const VisualDensity(vertical: -4),
                                ),
                                // child: const Text('Save'),
                                label: Text(lang.select),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.all(
                              sizeInfo.innerSpacing / 2),
                          child: TextFieldLabelWrapper(
                              //labelText: 'Example Textarea',
                              labelText: '',
                              inputField: ElevatedButton(
                                  onPressed: () {
                                    context.read<InitialRequestBloc>().add(
                                          InitialRequestCreateEvent(
                                            InitialRequestCreate(
                                              /* id: '0', */
                                              requestNumber:
                                                  _requestNumberController.text,
                                              requestDate: DateTime.tryParse(
                                                  _requestDateController.text),
                                              estimatedAmount:
                                                  _estimatedAmountController
                                                      .text,
                                              yearFrom:
                                                  _dateFromController.text,
                                              yearTo: _dateToController.text,
                                              cdRepContact:
                                                  _cdRepContactController.text,
                                              subject: _subjectController.text,
                                              documentFees:
                                                  _documentFeesController.text,
                                              uploadDocument:
                                                  _uploadController.text,
                                              state: _stateController.text,
                                              nextStep:
                                                  _nextStepController.text,
                                              /* sectorId: selectedSectorId,
                                              deptId: selectedDeptId, */
                                            ),
                                          ),
                                        );
                                  },
                                  child: Text(lang.submit))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sizeInfo.innerSpacing),

            // Input Sizing
            // ShadowContainer(
            //   // headerText: 'Input Sizing',
            //   headerText: lang.requestlist,

            // child: ResponsiveGridRow(
            //   children: [
            //     ...{
            //       "${lang.input} SM": "SM",
            //       "${lang.input} MD": "MD",
            //       "${lang.input} LG": "LG",
            //     }.entries.map(
            //       (prop) {
            //         final double xPadding = switch (prop.value) {
            //           // "SM" => 16,
            //           // "MD" => 16,
            //           // "LG" => 16,
            //           _ => 16,
            //         };
            //         final double yPadding = switch (prop.value) {
            //           "SM" => 4,
            //           "MD" => 8,
            //           "LG" => 12,
            //           _ => 16,
            //         };

            //         return ResponsiveGridCol(
            //           lg: lg,
            //           md: md,
            //           child: Padding(
            //             padding: EdgeInsetsDirectional.all(
            //                 sizeInfo.innerSpacing / 2),
            //             child: TextFieldLabelWrapper(
            //               labelText: prop.key,
            //               inputField: TextFormField(
            //                 decoration: InputDecoration(
            //                   hintText: prop.key,
            //                   contentPadding: EdgeInsetsDirectional.symmetric(
            //                     horizontal: xPadding,
            //                     vertical: yPadding,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),

            //     // //  Rounded Fields
            //     // ...{
            //     //   "${lang.rounded} SM": "SM",
            //     //   "${lang.rounded} MD": "MD",
            //     //   "${lang.rounded} LG": "LG",
            //     // }.entries.map(
            //     //   (prop) {
            //     //     final double xPadding = switch (prop.value) {
            //     //       // "SM" => 16,
            //     //       // "MD" => 16,
            //     //       // "LG" => 16,
            //     //       _ => 16,
            //     //     };
            //     //     final double yPadding = switch (prop.value) {
            //     //       "SM" => 4,
            //     //       "MD" => 8,
            //     //       "LG" => 12,
            //     //       _ => 16,
            //     //     };
            //     //     return ResponsiveGridCol(
            //     //       lg: lg,
            //     //       md: md,
            //     //       child: Padding(
            //     //         padding: EdgeInsetsDirectional.all(
            //     //             sizeInfo.innerSpacing / 2),
            //     //         child: TextFieldLabelWrapper(
            //     //           labelText: prop.key,
            //     //           inputField: TextFormField(
            //     //             decoration: InputDecoration(
            //     //               hintText: prop.key,
            //     //               contentPadding: EdgeInsetsDirectional.symmetric(
            //     //                 horizontal: xPadding,
            //     //                 vertical: yPadding,
            //     //               ),
            //     //               border: inputFieldStyle.getRoundedBorder(),
            //     //               enabledBorder: inputFieldStyle.getRoundedBorder(
            //     //                 getRoundedBorderType:
            //     //                     RoundedBorderType.enabledBorder,
            //     //               ),
            //     //               focusedBorder: inputFieldStyle.getRoundedBorder(
            //     //                 getRoundedBorderType:
            //     //                     RoundedBorderType.focusedBorder,
            //     //               ),
            //     //               errorBorder: inputFieldStyle.getRoundedBorder(
            //     //                 getRoundedBorderType:
            //     //                     RoundedBorderType.errorBorder,
            //     //               ),
            //     //               focusedErrorBorder:
            //     //                   inputFieldStyle.getRoundedBorder(
            //     //                 getRoundedBorderType:
            //     //                     RoundedBorderType.focusedErrorBorder,
            //     //               ),
            //     //               disabledBorder: inputFieldStyle.getRoundedBorder(
            //     //                 getRoundedBorderType:
            //     //                     RoundedBorderType.disabledBorder,
            //     //               ),
            //     //             ),
            //     //           ),
            //     //         ),
            //     //       ),
            //     //     );
            //     //   },
            //     // ),
            //   ],
            // ),
            // ),
            SizedBox(height: sizeInfo.innerSpacing),

            // File Input
          ],
        ),
      ),
    );
  }
}

class _SizeInfo {
  final double? fonstSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.fonstSize,
    this.padding = const EdgeInsetsDirectional.all(24),
    this.innerSpacing = 24,
  });
}
