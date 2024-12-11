// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/core/theme/_app_colors.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;

class AddressDetailsForm extends StatefulWidget {
  final TabController tabController;
  const AddressDetailsForm({super.key, required this.tabController});

  @override
  State<AddressDetailsForm> createState() => _AddressDetailsFormState();
}

// final Map<String, List<String>> options = {
//     'Ahmadi Governorate': ['Abu Halifa', 'Abdullah Port'],
//     'Al-Asimah Governorate': ['Abdulla Al-Salem', 'Adailiya'],
//     'Farwaniya Governorate': ['Abdullah Al-Mubarak', 'Andalous'],
//     'Hawalli Governorate': ['Bayān', 'Hawally'],
//     'Jahra Governorate': ['Abdali', 'Jahra'],
//     'Mubarak Al-Kabeer Governorate': ['Abu Al Hasaniya', 'Abu Futaira',],
//   };

late TabController _tabController;

final Map<String, List<DropdownMenuItem<String>>> governorateToArea = {
  '1': [
    DropdownMenuItem(value: 'Abu Halifa', child: Text('Abu Halifa')),
    DropdownMenuItem(value: 'Abdullah Port', child: Text('Abdullah Port')),
  ],
  '2': [
    DropdownMenuItem(
        value: 'Abdulla Al-Salem', child: Text('Abdulla Al-Salem')),
    DropdownMenuItem(value: 'Adailiya', child: Text('Adailiya')),
  ],
  '3': [
    DropdownMenuItem(
        value: 'Abdullah Al-Mubarak', child: Text('Abdullah Al-Mubarak')),
    DropdownMenuItem(value: 'Andalous', child: Text('Andalous')),
  ],
  '4': [
    DropdownMenuItem(value: 'Bayān', child: Text('Bayān')),
    DropdownMenuItem(value: 'Hawally', child: Text('Hawally')),
  ],
  '5': [
    DropdownMenuItem(value: 'Abdali', child: Text('Abdali')),
    DropdownMenuItem(value: 'Jahra', child: Text('Jahra')),
  ],
  '6': [
    DropdownMenuItem(value: 'Abu Al Hasaniya', child: Text('Abu Al Hasaniya')),
    DropdownMenuItem(value: 'Abu Futaira', child: Text('Abu Futaira')),
  ],
};
String? selected;
final FormGroup addressDetailsForm = FormGroup({
  'country': FormControl<String>(
    validators: [Validators.required],
  ),
  'governorate': FormControl<String>(
    validators: [Validators.required],
  ),
  'area': FormControl<String>(
    validators: [Validators.required],
  ),
  'block': FormControl<String>(
    validators: [Validators.required],
  ),
  'building': FormControl<String>(
    validators: [Validators.required],
  ),
  'street': FormControl<String>(
    validators: [Validators.required],
  ),
  'floor': FormControl<String>(
    validators: [Validators.required],
  ),
  'office': FormControl<String>(
    validators: [Validators.required],
  ),
  'paci': FormControl<String>(
    validators: [Validators.required],
  ),
});

class _AddressDetailsFormState extends State<AddressDetailsForm> {
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
              headerText: lang.address,
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'country',
                                decoration: InputDecoration(
                                  labelText: lang.country,
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
                        formGroup: addressDetailsForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReactiveDropdownField<String>(
                              formControlName: 'governorate',
                              decoration: InputDecoration(
                                labelText: lang.governorate,
                                border: const OutlineInputBorder(),
                              ),
                              items: [
                                DropdownMenuItem(
                                    value: '1',
                                    child: Text('Ahmadi Governorate')),
                                DropdownMenuItem(
                                    value: '2',
                                    child: Text('Al-Asimah Governorate')),
                                DropdownMenuItem(
                                    value: '3',
                                    child: Text('Farwaniya Governorate')),
                                DropdownMenuItem(
                                    value: '4',
                                    child: Text('Hawalli Governorate')),
                                DropdownMenuItem(
                                    value: '5',
                                    child: Text('Jahra Governorate')),
                                DropdownMenuItem(
                                    value: '6',
                                    child:
                                        Text('Mubarak Al-Kabeer Governorate')),
                              ],
                              onChanged: (control) {
                                setState(() {
                                  selected = control.value;
                                  addressDetailsForm
                                      .control('area')
                                      .reset(); // Reset the area field
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                        formGroup: addressDetailsForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReactiveDropdownField<String>(
                              formControlName: 'area',
                              decoration: InputDecoration(
                                labelText: lang.area,
                                border: const OutlineInputBorder(),
                              ),
                              items: addressDetailsForm
                                          .control('governorate')
                                          .value !=
                                      null
                                  ? governorateToArea[addressDetailsForm
                                          .control('governorate')
                                          .value] ??
                                      []
                                  : [],
                              validationMessages: {
                                ValidationMessage.required: (_) =>
                                    'Please select an area',
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'block',
                                decoration: InputDecoration(
                                  labelText: lang.block,
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
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'building',
                                decoration: InputDecoration(
                                  labelText: lang.building,
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
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'street',
                                decoration: InputDecoration(
                                  labelText: lang.street,
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
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'floor',
                                decoration: InputDecoration(
                                  labelText: lang.floor,
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
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'office',
                                decoration: InputDecoration(
                                  labelText: lang.office,
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
                          formGroup: addressDetailsForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'paci',
                                decoration: InputDecoration(
                                  labelText: lang.paci,
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
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          size: 17,
                          color: FinanceAppColors.kWhiteColor,
                        ),
                        onPressed: () {
                          widget.tabController.animateTo(1);
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
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          size: 17,
                          color: FinanceAppColors.kWhiteColor,
                        ),
                        onPressed: () {
                          if (addressDetailsForm.touched) {
                            widget.tabController.animateTo(3);
                            print('Form Value: ${addressDetailsForm.value}');
                          } else {
                            addressDetailsForm.markAllAsTouched();
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
