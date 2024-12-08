// 🐦 Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';



// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;

final browserDefaultFormKey = GlobalKey<FormState>();
class DocumentUploadForm extends StatefulWidget {
  const DocumentUploadForm({super.key});

  @override
  State<DocumentUploadForm> createState() => _DocumentUploadFormState();  
  
}



  
class _DocumentUploadFormState extends State<DocumentUploadForm> {
  final FormGroup documentUploadForm = FormGroup({
    'documentName': FormControl<String>(
      validators: [Validators.required],
    ),
    'expireDate': FormControl<String>(
      validators: [Validators.required],
    ),
  });
  final List<String> dynamicFields = ['documentName','expireDate'];
 List<Widget> _widgetList = [];
   List<TextEditingController> controllers = [];

   void addUpload() {
    setState(() {
      controllers.add(TextEditingController());
    });
  }
  
  bool isBrowserDefaultChecked = false;

  final customFormKey = GlobalKey<FormState>();
  bool isCustomFormChecked = false;

  @override
  Widget build(BuildContext context) {
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

return Scaffold(

  body: Column(
    children: [
      Expanded(
        child: ListView(
          shrinkWrap: true,
            padding: sizeInfo.padding,
            children: [
              // Browser Default Form
              Form(
                key: browserDefaultFormKey,
                child: ShadowContainer(
                  //headerText: 'Browser Defaults',
                  headerText: lang.address,
                  child: ResponsiveGridRow(
                    children: [
                      // First Name
                      ResponsiveGridCol(
                        child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: addUpload,
                    child: Text('Add Upload'),
                  ),
                  SizedBox(height: 20),
                  // Dynamically generated TextFields
                  Column(
                    children: controllers
                        .map((controller) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  ReactiveForm(
            formGroup: documentUploadForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                 Row(
                    children: [
                      // Left section (taking 50% of the space)
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.transparent,
                          child: ReactiveTextField<String>(
                  formControlName: 'documentName',
                  decoration: InputDecoration(
                    labelText: lang.documentName,
                    border: const OutlineInputBorder(),
                    suffixIcon: ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                    if (result != null && documentUploadForm.valid) {
                      documentUploadForm.control('documentName').value = result.files.single.name;
                      print('Uploaded file path: ${result.files.single.path}');
                    } else {
                      documentUploadForm.markAllAsTouched();
                    }
                  },
                  child: const Text('Browse'),
                ),
                  ),
                ),
                        ),
                      ),
                      
                      SizedBox(width: 16), // Space between the two columns
                      
                      // Right section (taking 50% of the space)
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.transparent,
                          child: ReactiveForm(
            formGroup: documentUploadForm,
            child: Column(
              children: [
                ReactiveTextField<String>(
                  formControlName: 'expireDate',
                  decoration: InputDecoration(
                    labelText: lang.expireDate,
                    border: OutlineInputBorder(),
                    suffixIcon: ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    ).then((pickedDate) {
                      if (pickedDate != null) {
                        documentUploadForm.control('expireDate').value = pickedDate.toString();
                      }
                    });
                  },
                child: Icon(Icons.calendar_month, color: Colors.white,),
                ),
                  ),
                ),
                
              ],
            ),
                ),
                        ),
                      ),
                     
                    ],
                  ),
                
              ],
            ),
                ),
                                ],
                              ),
                             
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),              
      
                     
                      
      
                      // Save Form Button
                      
                      
                      
                      
                    ],
                    
                  ),
                  
                ),
              ),         
              
            ],
            
          ),
      ),
      Expanded(
        child: 
        Row(
          children: [
            ResponsiveGridCol(
                        
                        lg: 2,
                        md: 3,
                        xl: 2,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ElevatedButton.icon(
                             icon: Icon(Icons.arrow_back_rounded,size: 17,),
                            onPressed: () {
                              // if (browserDefaultFormKey.currentState?.validate() ==
                              //     true) {
                              //   browserDefaultFormKey.currentState?.save();
                              // }
                              if (documentUploadForm.valid) {
                        print('Form Value: ${documentUploadForm.value}');
                      } else {
                        documentUploadForm.markAllAsTouched();
                      }
                            },
                            //child: const Text('Save From'),
                            label: Text(lang.previous),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        
                        lg: 2,
                        md: 3,
                        xl: 2,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ElevatedButton.icon(
                             icon: Icon(Icons.save_alt_rounded,size: 17,),
                            onPressed: () {
                              // if (browserDefaultFormKey.currentState?.validate() ==
                              //     true) {
                              //   browserDefaultFormKey.currentState?.save();
                              // }
                              if (documentUploadForm.valid) {
                        // print('Form Value: ${documentUploadForm.value}');
                      } else {
                        documentUploadForm.markAllAsTouched();
                      }
                            },
                            //child: const Text('Save From'),
                            label: Text(lang.submit),
                          ),
                        ),
                      ),
          ],
        )
        ),
    ],
  ),
    
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Padding(
      //     padding: EdgeInsets.all(16.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         ElevatedButton(
      //           onPressed: addTextField,
      //           child: Text('Add TextField'),
      //         ),
      //         SizedBox(height: 20),
      //         // Dynamically generated TextFields
      //         Column(
      //           children: controllers
      //               .map((controller) => Padding(
      //                     padding: const EdgeInsets.symmetric(vertical: 8.0),
      //                     child: Column(
      //                       children: [
      //                         ReactiveForm(
      //   formGroup: documentUploadForm,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
            
      //        Row(
      //           children: [
      //             // Left section (taking 50% of the space)
      //             Expanded(
      //               flex: 5,
      //               child: Container(
      //                 padding: EdgeInsets.all(8),
      //                 color: Colors.transparent,
      //                 child: ReactiveTextField<String>(
      //         formControlName: 'documentName',
      //         decoration: InputDecoration(
      //           labelText: lang.documentName,
      //           border: const OutlineInputBorder(),
      //           suffixIcon: ElevatedButton(
      //         onPressed: () async {
      //           FilePickerResult? result = await FilePicker.platform.pickFiles();
      //           if (result != null && documentUploadForm.valid) {
      //             documentUploadForm.control('documentName').value = result.files.single.name;
      //             print('Uploaded file path: ${result.files.single.path}');
      //           } else {
      //             documentUploadForm.markAllAsTouched();
      //           }
      //         },
      //         child: const Text('Browse'),
      //       ),
      //         ),
      //       ),
      //               ),
      //             ),
                  
      //             SizedBox(width: 16), // Space between the two columns
                  
      //             // Right section (taking 50% of the space)
      //             Expanded(
      //               flex: 5,
      //               child: Container(
      //                 padding: EdgeInsets.all(8),
      //                 color: Colors.transparent,
      //                 child: ReactiveForm(
      //   formGroup: documentUploadForm,
      //   child: Column(
      //     children: [
      //       ReactiveTextField<String>(
      //         formControlName: 'expireDate',
      //         decoration: InputDecoration(
      //           labelText: lang.expireDate,
      //           border: OutlineInputBorder(),
      //           suffixIcon: ElevatedButton(
      //         onPressed: () {
      //           showDatePicker(
      //             context: context,
      //             initialDate: DateTime.now(),
      //             firstDate: DateTime(2000),
      //             lastDate: DateTime(2100),
      //           ).then((pickedDate) {
      //             if (pickedDate != null) {
      //               documentUploadForm.control('expireDate').value = pickedDate.toString();
      //             }
      //           });
      //         },
      //       child: Icon(Icons.calendar_month, color: Colors.white,),
      //       ),
      //         ),
      //       ),
            
      //     ],
      //   ),
      //       ),
      //               ),
      //             ),
                 
      //           ],
      //         ),
            
      //     ],
      //   ),
      //       ),
      //                       ],
      //                     ),
                         
      //                   ))
      //               .toList(),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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


