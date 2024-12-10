import 'package:flutter/material.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/old/_document_upload.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import '../../../../../../generated/l10n.dart' as l;

class DynamicControlsWidgets extends StatefulWidget {
  const DynamicControlsWidgets({super.key});

  @override
  State<DynamicControlsWidgets> createState() => _DynamicControlsWidgetsState();
}

class _DynamicControlsWidgetsState extends State<DynamicControlsWidgets> {
  @override
Widget build(BuildContext context) {
    final FormGroup documentUploadForm = FormGroup({
    'documentName': FormControl<String>(
      validators: [Validators.required],
    ),
    'expireDate': FormControl<String>(
      validators: [Validators.required],
    ),
  });
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
      body: ListView(
        padding: sizeInfo.padding,
        children: [
          // Browser Default Form
          Form(
            key: browserDefaultFormKey,
            child: ShadowContainer(
              //headerText: 'Browser Defaults',
              // headerText: lang.upload,
              child: ResponsiveGridRow(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                 
              ResponsiveGridCol(
  lg: lg ,
  md: md,
  child: Padding(
    padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
    child: ReactiveForm(
      formGroup: documentUploadForm,
      child: Column(
        children: [
          ReactiveTextField<String>(
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
          
        ],
      ),
    ),
  ),
),

ResponsiveGridCol(
  lg: lg,
  md: md,
  child: Padding(
    padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
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
ResponsiveGridCol(
  lg: lg,
  md: md,
  child: Padding(
    padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
    child: ReactiveForm(
      formGroup: documentUploadForm,
      child: Column(
        children: [
      
            ElevatedButton(
            onPressed: () {
              
            },
          child: Icon(Icons.add_rounded, color: Colors.white,),
          ),
          
          
          
        ],
      ),
    ),
  ),
),
                  
                  
                ],
              ),
            ),
          ),
          // SizedBox(height: sizeInfo.innerSpacing),
         
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
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}