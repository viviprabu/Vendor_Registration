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


class PersonalDetailsForm extends StatefulWidget {
  final TabController tabController;
  const PersonalDetailsForm({super.key, required this.tabController});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState(); 
  
}

final FormGroup personalDetailsForm = FormGroup({
    'fullName': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
    'email': FormControl<String>(
      value: '',
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required, Validators.minLength(8)],
    ),
    'mobileNumber': FormControl<String>(
      validators: [Validators.required, Validators.maxLength(8)],
    ),
    'civilId': FormControl<String>(
      validators: [Validators.required, Validators.maxLength(12)],
    ),
     'terms': FormControl<bool>(
      validators: [Validators.required],
    ),
  });
FocusNode _focusNode = FocusNode();

  
class _PersonalDetailsFormState extends State<PersonalDetailsForm> with  SingleTickerProviderStateMixin{
 
late TabController _tabController;


    @override
 void initState(){
  super.initState();
  _tabController = TabController(length: 5, vsync: this);
 }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void _goToNextTab() {
  //   print(_tabController.index);
  //   if (_tabController.index < _tabController.length - 1) {
  //     _tabController.animateTo(_tabController.index + 1);
  //   }
  // }
 
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
            fonstSize: 12,
            padding: EdgeInsets.all(16),
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
              headerText: lang.personal,
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                        formGroup: personalDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'fullName',
                decoration: InputDecoration(
                  labelText: lang.name,
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
                        formGroup: personalDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'email',
                decoration: InputDecoration(
                  labelText: lang.email,
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
                        formGroup: personalDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'password',
                decoration: InputDecoration(
                  labelText: lang.password,
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
                        formGroup: personalDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'mobileNumber',
                decoration: InputDecoration(
                  labelText: lang.mobileNumber,
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
                        formGroup: personalDetailsForm, 
                        child: Column(
                          children: [
                            ReactiveTextField<String>(
                formControlName: 'civilId',
                decoration: InputDecoration(
                  labelText: lang.civilId,
                  border: OutlineInputBorder(),
                ),
              ),
              
                          ],
                        )),
                     
                    ),
                    
                  ),              

                  
                  ResponsiveGridCol(child: Text('')),
  
                  // Save Form Button
                  
                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ElevatedButton(
                        focusNode: _focusNode,
                        onPressed: () {
                          
                           if (personalDetailsForm.touched) {
                       widget.tabController.animateTo(1);
                            
                    // If the form is valid, do something
                    // print('Form is valid');
                  } else {
                    // If the form is not valid, mark all controls as touched
                    personalDetailsForm.markAllAsTouched();
                  }
                       },
                        //child: const Text('Save From'),
                        child: Text(lang.next),
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

extension on TabController {
  void switchToTab(int initialIndex) {
    
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
