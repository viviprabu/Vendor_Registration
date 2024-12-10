// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';


// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;


class CompanyDetailsForm extends StatefulWidget {
  final TabController tabController;
  const CompanyDetailsForm({super.key,required this.tabController});

  @override
  State<CompanyDetailsForm> createState() => _CompanyDetailsFormState();
  
}

final FormGroup companyDetailsForm = FormGroup({
    'companyNameArabic': FormControl<String>(
      validators: [Validators.required],
    ),
    'companyNameEnglish': FormControl<String>(
      validators: [Validators.required],
    ),
    'address': FormControl<String>(
      validators: [Validators.required],
    ),
    'phoneNumber': FormControl<String>(
      validators: [Validators.required],
    ),
    'fax': FormControl<String>(
      validators: [],
    ),
     'website': FormControl<String>(
      validators: [],
    ),
     'postBox': FormControl<String>(
      validators: [],
    ),
     'postalCode': FormControl<String>(
      validators: [],
    ),
     'postalArea': FormControl<String>(
      validators: [],
    ),
    
  });
class _CompanyDetailsFormState extends State<CompanyDetailsForm> {
  final browserDefaultFormKey = GlobalKey<FormState>();
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
      body: ListView(
        padding: sizeInfo.padding,
        children: [
          // Browser Default Form
          Form(
            key: browserDefaultFormKey,
            child: ShadowContainer(
              //headerText: 'Browser Defaults',
              headerText: lang.company,
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(                           
                formControlName: 'companyNameArabic',
                decoration: InputDecoration(
                  labelText: lang.companyNameArabic,
                  // labelStyle: TextStyle(fontSize: 10),
                  border: OutlineInputBorder(),
                ),
              ),
                          ],
                        )),                    
                    ),
                  ),

                  // Last Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'companyNameEnglish',
                decoration: InputDecoration(
                  labelText: lang.companyNameEnglish,
                  border: OutlineInputBorder(),
                ),
              ),
                          ],
                        )),
                     
                    ),
                  ),
                    ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'address',
                decoration: InputDecoration(
                  labelText: lang.address,
                  border: OutlineInputBorder(),
                ),
              ),
                          ],
                        )),
                     
                    ),
                  ),
                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'phoneNumber',
                decoration: InputDecoration(
                  labelText: lang.phoneNumber,
                  border: OutlineInputBorder(),
                ),
              ),
              
                          ],
                        )),
                     
                    ),
                  ),

                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'fax',
                decoration: InputDecoration(
                  labelText: lang.fax,
                  border: OutlineInputBorder(),
                ),
              ),
              
                          ],
                        )),
                     
                    ),
                    
                  ),
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'website',
                decoration: InputDecoration(
                  labelText: lang.website,
                  border: OutlineInputBorder(),
                ),
              ),
              
                          ],
                        )),
                     
                    ),
                    
                  ),
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'postBox',
                decoration: InputDecoration(
                  labelText: lang.postBox,
                  border: OutlineInputBorder(),
                ),
              ),
              
                          ],
                        )),
                     
                    ),
                    
                  ),
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'postalCode',
                decoration: InputDecoration(
                  labelText: lang.postalCode,
                  border: OutlineInputBorder(),
                ),
              ),              
                          ],
                        )),
                     
                    ),
                    
                  ),
                 ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                        child: ReactiveForm(
                        formGroup: companyDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'postalArea',
                decoration: InputDecoration(
                  labelText: lang.postalArea,
                  border: OutlineInputBorder(),
                ),
              ),              
                          ],
                        )),
                     
                    ),
                    
                  ),

                  // City Dropdown
                  

                  // Check Box
                  // ResponsiveGridCol(
                  //   lg: 12,
                  //   md: 12,
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                      
                  //     child: FinanceCheckBoxFormField(
                  //       // title: const Text('Agree to terms and conditions'),
                  //       title: Text(lang.agreeToTermsAndConditions),
                  //       validator: (value) {
                  //         if (value == null || !value) {
                  //           //return 'Please check this box to continue';
                  //           return lang.pleaseCheckThisBoxToContinue;
                  //         }
                  //         return null;
                         
                  //       },
                  //       autovalidateMode: AutovalidateMode.onUserInteraction,
                  //     ),
                  //   ),
                  // ),
                  ResponsiveGridCol(child: Text('')),
             
  
                  // Save Form Button
                  
                  ResponsiveGridCol(                    
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.arrow_back_rounded,size: 17,),
                        onPressed: () {
                       
                          widget.tabController.animateTo(0);
                   
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
                        icon: Icon(Icons.arrow_forward_rounded,size: 17,),
                        onPressed: () {
                       if (companyDetailsForm.touched) {
                        widget.tabController.animateTo(2);
                    print('Form Value: ${companyDetailsForm.value}');
                  } else {
                    companyDetailsForm.markAllAsTouched();
                  }
                        },
                        //child: const Text('Save From'),
                        label: Text(lang.next),
                      ),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
          ),
          SizedBox(height: sizeInfo.innerSpacing),

        
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
