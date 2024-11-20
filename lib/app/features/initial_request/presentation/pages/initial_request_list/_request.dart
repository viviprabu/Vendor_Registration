// 🐦 Flutter imports:
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:finance_app/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:finance_app/app/core/helpers/field_styles/_input_field_styles.dart';
import 'package:finance_app/app/core/static/_static_values.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
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

class RequestCreation extends StatefulWidget {
  const RequestCreation({super.key});

  @override
  State<RequestCreation> createState() => _RequestCreationState();
}

class _RequestCreationState extends State<RequestCreation> {
  // Field State Props
  final bool _obscureText = true;
  late final _requestNumberController = TextEditingController();
  late final _requestDateController = TextEditingController();
  late final _estimatedAmountController = TextEditingController();
  late final _dateFromController = TextEditingController();
  late final _dateToController = TextEditingController();
  late final _cdRepContactController = TextEditingController();
  late final _subjectController = TextEditingController();
  late final _listOfCdController = TextEditingController();
  late final _documentFeesController = TextEditingController();
  late final _uploadController = TextEditingController();

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
    final lang = l.S.of(context);
    final theme = Theme.of(context);
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

    return Scaffold(
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
                              decoration: InputDecoration(hintText: prop.value),
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
                            _dateFromController.text = DateFormat(
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
                      //labelText: 'Input Date',
                      labelText: lang.yearTo,
                      inputField: TextFormField(
                        controller: _dateToController,
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
                            _dateToController.text = DateFormat(
                                    AppDateConfig.appNumberOnlyDateFormat)
                                .format(result);
                          }
                        },
                      ),
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
                                padding: const EdgeInsetsDirectional.symmetric(
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
                                onPressed: () {}, child: Text(lang.submit))),
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
