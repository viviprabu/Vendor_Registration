// 🐦 Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/core/theme/theme.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/data_provider/data_provider.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;

class UploadPage extends StatefulWidget {
  final TabController tabController;

  const UploadPage({super.key, required this.tabController});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

final ScrollController _scrollController = ScrollController();
final FormGroup documentUploadForm = FormGroup({
  'documentName': FormControl<String>(
    validators: [Validators.required],
  ),
  'expireDate': FormControl<String>(
    validators: [Validators.required],
  ),
});

 final String _fileName = '';
  String? fileName;
final List<TextEditingController> uploadControllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

final List<TextEditingController> expiryControllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

final List<Map<String, String>> companyDocumentsList = [
  {
    'companyTypeId': '1',
    'name': 'Memorandum of Association',
  },
  {
    'companyTypeId': '1',
    'name': 'Ammendments to the memorandum of Association'
  },
  {
    'companyTypeId': '1',
    'name': 'Certificate from the Central Agency for Public Tenders'
  },
  {
    'companyTypeId': '1',
    'name': 'Certificate from the Central Agency for Information Technology'
  },
  {
    'companyTypeId': '1',
    'name': 'Certificate from the Chamber of Commerce and Industry'
  },
  {'companyTypeId': '1', 'name': 'National Labour Certificate'},
  {'companyTypeId': '1', 'name': 'Authorization Form'},
  {'companyTypeId': '1', 'name': 'Civil Information Certificate'},
  {'companyTypeId': '1', 'name': 'Commercial License Certificate'},
  {
    'companyTypeId': '2',
    'name': 'Memorandum of Association',
  },
  {
    'companyTypeId': '2',
    'name': 'Ammendments to the memorandum of Association'
  },
  {
    'companyTypeId': '2',
    'name': 'Certificate from the Central Agency for Public Tenders'
  },
  {
    'companyTypeId': '2',
    'name': 'Certificate from the Central Agency for Information Technology'
  },
  {
    'companyTypeId': '2',
    'name': 'Certificate from the Chamber of Commerce and Industry'
  },
  {'companyTypeId': '2', 'name': 'National Labour Certificate'},
  {'companyTypeId': '2', 'name': 'Authorization Form'},
  {
    'companyTypeId': '3',
    'name': 'Memorandum of Association',
  },
  {
    'companyTypeId': '3',
    'name': 'Ammendments to the memorandum of Association'
  },
  {
    'companyTypeId': '3',
    'name': 'Certificate from the Central Agency for Public Tenders'
  },
  {
    'companyTypeId': '3',
    'name': 'Certificate from the Central Agency for Information Technology'
  },
  {
    'companyTypeId': '3',
    'name': 'Certificate from the Chamber of Commerce and Industry'
  },
  {'companyTypeId': '3', 'name': 'National Labour Certificate'},
  {
    'companyTypeId': '4',
    'name': 'Memorandum of Association',
  },
  {
    'companyTypeId': '4',
    'name': 'Ammendments to the memorandum of Association'
  },
  {
    'companyTypeId': '4',
    'name': 'Certificate from the Central Agency for Public Tenders'
  },
  {
    'companyTypeId': '4',
    'name': 'Certificate from the Central Agency for Information Technology'
  },
  {
    'companyTypeId': '4',
    'name': 'Certificate from the Chamber of Commerce and Industry'
  },
  {'companyTypeId': '4', 'name': 'National Labour Certificate'},
  {'companyTypeId': '4', 'name': 'Authorization Form'},
  {'companyTypeId': '4', 'name': 'Civil Information Certificate'},
  {'companyTypeId': '4', 'name': 'Commercial License Certificate'},
  {
    'companyTypeId': '5',
    'name': 'Memorandum of Association',
  },
  {
    'companyTypeId': '5',
    'name': 'Ammendments to the memorandum of Association'
  },
  {
    'companyTypeId': '5',
    'name': 'Certificate from the Central Agency for Public Tenders'
  },
  {
    'companyTypeId': '5',
    'name': 'Certificate from the Central Agency for Information Technology'
  },
  {
    'companyTypeId': '5',
    'name': 'Certificate from the Chamber of Commerce and Industry'
  },
  {'companyTypeId': '5', 'name': 'National Labour Certificate'},
  {'companyTypeId': '5', 'name': 'Authorization Form'},
  {'companyTypeId': '5', 'name': 'Civil Information Certificate'},
  {
    'companyTypeId': '6',
    'name': 'Memorandum of Association',
  },
  {
    'companyTypeId': '6',
    'name': 'Ammendments to the memorandum of Association'
  },
  {
    'companyTypeId': '6',
    'name': 'Certificate from the Central Agency for Public Tenders'
  },
  {
    'companyTypeId': '6',
    'name': 'Certificate from the Central Agency for Information Technology'
  },
  {
    'companyTypeId': '6',
    'name': 'Certificate from the Chamber of Commerce and Industry'
  },
];

String? _filePath;



String formatDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

class _UploadPageState extends State<UploadPage> {
  final browserDefaultFormKey = GlobalKey<FormState>();
  bool isBrowserDefaultChecked = false;

  final customFormKey = GlobalKey<FormState>();
  bool isCustomFormChecked = false;

  // Future<void> pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform
  //       .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

  //   if (result != null) {
  //     PlatformFile file = result.files.first;

  //     setState(() {
  //       _filePath = file.path;

  //     });

  //     // Call the function to save the file locally
  //     saveFile(file);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final companyTypeData = context.watch<DataProvider>().data;
    final filteredData = companyDocumentsList
        .where((data) => data['companyTypeId'] == companyTypeData.toString())
        .toList();

    // final _theme = Theme.of(context);
    final lang = l.S.of(context);
    final dropdownStyle = FinanceDropdownStyle(context);
    // final _inputFieldStyle = FinanceInputFieldStyles(context);
    const lg = 4;
    const md = 6;

    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 992,
          value: _SizeInfo(
            fonstSize: 10,
            padding: EdgeInsets.all(5),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;
    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
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
                                    child: Theme(
                                      data: ThemeData(
                                          dividerColor:
                                              theme.colorScheme.outline,
                                          dividerTheme: DividerThemeData(
                                            color: theme.colorScheme.outline,
                                          )),
                                      child: DataTable(
                                        checkboxHorizontalMargin: 16,
                                        headingTextStyle: textTheme.titleMedium,
                                        dataTextStyle: textTheme.bodySmall,
                                        headingRowColor:
                                            WidgetStateProperty.all(
                                                theme.colorScheme.secondary),
                                        showBottomBorder: true,
                                        columns: [
                                          DataColumn(label: Text(lang.name)),
                                          DataColumn(label: Text(lang.upload)),
                                          DataColumn(
                                              label: Text(lang.expireDate)),
                                          DataColumn(label: Text(lang.delete)),
                                        ],
                                        rows: List.generate(
                                          filteredData.length,
                                          (index) {
                                            return DataRow(
                                              color:
                                                  WidgetStateColor.transparent,
                                              cells: [
                                                DataCell(Text(
                                                    filteredData[index]
                                                        ['name']!)),
                                                DataCell(
                                            Container(
                                              height: 30,
                                              child: TextFormField(
                                                controller:
                                                    uploadControllers[index],
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                      style: IconButton.styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.elliptical(
                                                                  10,
                                                                  10)), // No rounding, making it a rectangle
                                                        ),
                                                        backgroundColor:
                                                            FinanceAppColors
                                                                .kSecondaryBtnColor,
                                                        // focusColor: FinanceAppColors.kWhiteColor,
                                                        foregroundColor:
                                                            FinanceAppColors
                                                                .kWhiteColor,
                                                      ),
                                                      icon: Icon(Icons
                                                          .file_upload_rounded,size: 15,),
                                                      onPressed: () async {
                                                        final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
                                                      
                                              
                                                  if (result != null && result.files.isNotEmpty) {
                                                      final isValidFile = validateFile(result.files.first);
                                                      if(isValidFile){
                                                      setState(() {
                                                      fileName = result.files.first.name;
                                                      uploadControllers[index].text = fileName.toString(); 
                                                       print(result.files);// Get the file name
                                                    });
                                                      }else{
                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid file selected. Only PDF files are allowed.')));
                                                      }
                                                    
                                                   
                                                  }
                                                        // FilePickerResult? result =
                                                        //     await FilePicker
                                                        //         .platform
                                                        //         .pickFiles(
                                                        //             type: FileType
                                                        //                 .custom,
                                                        //             allowedExtensions: [
                                                        //       'pdf'
                                                        //     ]);
                                              
                                                        // if (result != null) {
                                                        //   PlatformFile file =
                                                        //       result.files.first;
                                                        //   uploadControllers[index]
                                                        //       .text = file.name;
                                                        //   setState(() {
                                                        //     _filePath = file.path;
                                                        //   });
                                              
                                                          // Call the function to save the file locally
                                                          // saveFile(file);
                                                           
                                                        // }
                                                      }
                                              
                                                      // onPressed: () async {
                                                      //   FilePickerResult? result =
                                                      //       await FilePicker
                                                      //           .platform
                                                      //           .pickFiles();
                                              
                                                      //   if (result != null) {
                                                      //     final file =
                                                      //         result.files.single;
                                                      //     final isValidFile =
                                                      //         validateFile(file);
                                              
                                                      //     if (isValidFile) {
                                                      //       uploadControllers[index]
                                                      //           .text = file.name;
                                                      //       // print(controllers[index].text);
                                                      //     } else {
                                                      //       ScaffoldMessenger.of(
                                                      //               context)
                                                      //           .showSnackBar(SnackBar(
                                                      //               content: Text(
                                                      //                   'Invalid file selected. Only PDF files are allowed.')));
                                                      //     }
                                                      //   } else {
                                                      //     ScaffoldMessenger.of(
                                                      //             context)
                                                      //         .showSnackBar(SnackBar(
                                                      //             content: Text(
                                                      //                 'Select any PDF files to upload')));
                                                      //   }
                                                      //   // controllers[index].clear(); // Clears the text when the button is pressed
                                                      // },
                                                      ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a name';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Container(
                                              height: 30,                                              
                                              child: TextFormField(
                                                controller:
                                                    expiryControllers[index],
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                    style: IconButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .all(Radius.elliptical(
                                                                10,
                                                                10)), // No rounding, making it a rectangle
                                                      ),
                                                      backgroundColor:
                                                          FinanceAppColors
                                                              .kSuccess,
                                                      foregroundColor:
                                                          FinanceAppColors
                                                              .kWhiteColor,
                                                    ),
                                                    icon: Icon(Icons
                                                        .calendar_month_rounded,size: 15,),
                                                    onPressed: () {
                                                      showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(2000),
                                                        lastDate: DateTime(2100),
                                                      ).then((pickedDate) {
                                                        if (pickedDate != null) {
                                                          expiryControllers[index]
                                                                  .text =
                                                              formatDate(
                                                                  pickedDate);
                                                        }
                                                      });
                                                      // controllers[index].clear(); // Clears the text when the button is pressed
                                                    },
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a name';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Container(
                                              height: 30,
                                              child: IconButton(
                                                style: IconButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .all(Radius.elliptical(10,
                                                            10)), // No rounding, making it a rectangle
                                                  ),
                                                  backgroundColor:
                                                      FinanceAppColors.kError,
                                                  foregroundColor:
                                                      FinanceAppColors
                                                          .kWhiteColor,
                                                ),
                                                icon: Icon(
                                                    Icons.delete_forever_rounded,size: 15,),
                                                onPressed: () {
                                                  uploadControllers[index]
                                                      .clear();
                                                  expiryControllers[index]
                                                      .clear(); //
                                                },
                                              ),
                                            ),
                                          ),
                                              ],
                                            );
                                          },
                                        ).toList(),
                                      ),
                                    ),
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
                              child: Theme(
                                data: ThemeData(
                                    dividerColor: theme.colorScheme.outline,
                                    dividerTheme: DividerThemeData(
                                      color: theme.colorScheme.outline,
                                    )),
                                child: DataTable(
                                  checkboxHorizontalMargin: 16,
                                  headingTextStyle: textTheme.titleMedium,
                                  dataTextStyle: textTheme.bodySmall,
                                  headingRowColor: WidgetStateProperty.all(
                                      theme.colorScheme.secondary),
                                  showBottomBorder: true,
                                  columns: [
                                    DataColumn(label: Text(lang.fileName)),
                                    DataColumn(label: Text(lang.upload)),
                                    DataColumn(label: Text(lang.expireDate)),
                                    DataColumn(label: Text(lang.delete))
                                  ],
                                  rows: List.generate(
                                    filteredData.length,
                                    (index) {
                                      return DataRow(
                                        color: WidgetStateColor.transparent,
                                        cells: [
                                          DataCell(Text(
                                              filteredData[index]['name']!)),
                                          DataCell(
                                            Container(
                                              height: 30,
                                              child: TextFormField(
                                                controller:
                                                    uploadControllers[index],
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                      style: IconButton.styleFrom(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .all(Radius.elliptical(
                                                                  10,
                                                                  10)), // No rounding, making it a rectangle
                                                        ),
                                                        backgroundColor:
                                                            FinanceAppColors
                                                                .kSecondaryBtnColor,
                                                        // focusColor: FinanceAppColors.kWhiteColor,
                                                        foregroundColor:
                                                            FinanceAppColors
                                                                .kWhiteColor,
                                                      ),
                                                      icon: Icon(Icons
                                                          .file_upload_rounded,size: 15,),
                                                      onPressed: () async {
                                                        final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
                                                      
                                              
                                                  if (result != null && result.files.isNotEmpty) {
                                                      final isValidFile = validateFile(result.files.first);
                                                      if(isValidFile){
                                                      setState(() {
                                                      fileName = result.files.first.name;
                                                      uploadControllers[index].text = fileName.toString(); 
                                                       print(result.files);// Get the file name
                                                    });
                                                      }else{
                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid file selected. Only PDF files are allowed.')));
                                                      }
                                                    
                                                   
                                                  }
                                                        // FilePickerResult? result =
                                                        //     await FilePicker
                                                        //         .platform
                                                        //         .pickFiles(
                                                        //             type: FileType
                                                        //                 .custom,
                                                        //             allowedExtensions: [
                                                        //       'pdf'
                                                        //     ]);
                                              
                                                        // if (result != null) {
                                                        //   PlatformFile file =
                                                        //       result.files.first;
                                                        //   uploadControllers[index]
                                                        //       .text = file.name;
                                                        //   setState(() {
                                                        //     _filePath = file.path;
                                                        //   });
                                              
                                                          // Call the function to save the file locally
                                                          // saveFile(file);
                                                           
                                                        // }
                                                      }
                                              
                                                      // onPressed: () async {
                                                      //   FilePickerResult? result =
                                                      //       await FilePicker
                                                      //           .platform
                                                      //           .pickFiles();
                                              
                                                      //   if (result != null) {
                                                      //     final file =
                                                      //         result.files.single;
                                                      //     final isValidFile =
                                                      //         validateFile(file);
                                              
                                                      //     if (isValidFile) {
                                                      //       uploadControllers[index]
                                                      //           .text = file.name;
                                                      //       // print(controllers[index].text);
                                                      //     } else {
                                                      //       ScaffoldMessenger.of(
                                                      //               context)
                                                      //           .showSnackBar(SnackBar(
                                                      //               content: Text(
                                                      //                   'Invalid file selected. Only PDF files are allowed.')));
                                                      //     }
                                                      //   } else {
                                                      //     ScaffoldMessenger.of(
                                                      //             context)
                                                      //         .showSnackBar(SnackBar(
                                                      //             content: Text(
                                                      //                 'Select any PDF files to upload')));
                                                      //   }
                                                      //   // controllers[index].clear(); // Clears the text when the button is pressed
                                                      // },
                                                      ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a name';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Container(
                                              height: 30,                                              
                                              child: TextFormField(
                                                controller:
                                                    expiryControllers[index],
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  suffixIcon: IconButton(
                                                    style: IconButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .all(Radius.elliptical(
                                                                10,
                                                                10)), // No rounding, making it a rectangle
                                                      ),
                                                      backgroundColor:
                                                          FinanceAppColors
                                                              .kSuccess,
                                                      foregroundColor:
                                                          FinanceAppColors
                                                              .kWhiteColor,
                                                    ),
                                                    icon: Icon(Icons
                                                        .calendar_month_rounded,size: 15,),
                                                    onPressed: () {
                                                      showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate: DateTime(2000),
                                                        lastDate: DateTime(2100),
                                                      ).then((pickedDate) {
                                                        if (pickedDate != null) {
                                                          expiryControllers[index]
                                                                  .text =
                                                              formatDate(
                                                                  pickedDate);
                                                        }
                                                      });
                                                      // controllers[index].clear(); // Clears the text when the button is pressed
                                                    },
                                                  ),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a name';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            Container(
                                              height: 30,
                                              child: IconButton(
                                                style: IconButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .all(Radius.elliptical(10,
                                                            10)), // No rounding, making it a rectangle
                                                  ),
                                                  backgroundColor:
                                                      FinanceAppColors.kError,
                                                  foregroundColor:
                                                      FinanceAppColors
                                                          .kWhiteColor,
                                                ),
                                                icon: Icon(
                                                    Icons.delete_forever_rounded,size: 15,),
                                                onPressed: () {
                                                  uploadControllers[index]
                                                      .clear();
                                                  expiryControllers[index]
                                                      .clear(); //
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),

                    //______________________________________________________________________footer__________________
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: 17,
                            color: FinanceAppColors.kWhiteColor,
                          ),
                          onPressed: () {
                            widget.tabController.animateTo(2);
                          },
                          //child: const Text('Save From'),
                          label: Text(lang.previous),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.arrow_forward_rounded,
                            size: 17,
                            color: FinanceAppColors.kWhiteColor,
                          ),
                          onPressed: () {
                            if (documentUploadForm.touched) {
                              context.go('/authentication/signin');
                              print('Form Value: ${documentUploadForm.value}');
                            } else {
                              documentUploadForm.markAllAsTouched();
                            }
                          },
                          //child: const Text('Save From'),
                          label: Text(lang.submit),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
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
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}

bool validateFile(PlatformFile file) {
  // Define your own validation logic (e.g., file extension or size)
  final allowedTypes = ['pdf']; // Allowed file types
  final maxSize = 20 * 1024 * 1024; // Max file size (10MB)

  bool isValidType = allowedTypes.contains(file.extension);
  bool isValidSize = file.size <= maxSize;

  return isValidType && isValidSize;
}

// bool validateFile(PlatformFile file) {
//     // Check if the file has a .pdf extension
//     return file.extension == "pdf";
//   }

//--------------------------- Data Table List ---------------------------//
