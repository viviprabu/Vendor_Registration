// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/data_provider/data_provider.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/address_details.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/upload_page.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;

class OtherDetailsForm extends StatefulWidget {
  final TabController tabController;

  const OtherDetailsForm({super.key, required this.tabController});

  @override
  State<OtherDetailsForm> createState() => _OtherDetailsFormState();
}

final FormGroup otherDetailsForm = FormGroup({
  'companyType': FormControl<String>(
    validators: [Validators.required],
  ),
  'tradeApprovalNumber': FormControl<String>(
    validators: [Validators.required],
  ),
  'dateStarted': FormControl<String>(
    validators: [Validators.required],
  ),
  'contactName': FormControl<String>(
    validators: [Validators.required],
  ),
  'companyCivilId': FormControl<String>(
    validators: [Validators.required],
  ),
});

final List<Map<String, String>> companyTypeList = [
  {
    'id': '1',
    'name': 'CompanyType1',
  },
  {'id': '2', 'name': 'CompanyType2'},
  {'id': '3', 'name': 'CompanyType3'},
  {'id': '4', 'name': 'CompanyType4'},
  {'id': '5', 'name': 'CompanyType5'},
  {'id': '6', 'name': 'CompanyType6'},
];
String formatDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

class _OtherDetailsFormState extends State<OtherDetailsForm> {
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
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
            padding: sizeInfo.padding,
            children: [
              // Browser Default Form
              Form(
                key: browserDefaultFormKey,
                child: ShadowContainer(
                  //headerText: 'Browser Defaults',
                  headerText: lang.others,
                  child: ResponsiveGridRow(
                    children: [
                      // First Name
                      ResponsiveGridCol(
                        lg: lg,
                        md: md,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ReactiveForm(
                            formGroup: otherDetailsForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReactiveDropdownField<String>(
                                  formControlName: 'companyType',
                                  decoration: InputDecoration(
                                    labelText: lang.companyType,
                                    border: const OutlineInputBorder(),
                                  ),
                                  items: companyTypeList.map((e) {
                                    return DropdownMenuItem(
                                      value: e['id'],
                                      child: Text(e['name'] ?? ''),
                                    );
                                  }).toList(),
                                  onChanged: (control) {
                                    selected = control.value;
          
                                    context
                                        .read<DataProvider>()
                                        .updateData(control.value.toString());
          
                                    otherDetailsForm.control('companyType').value =
                                        control.value;
                                    // otherDetailsForm.control('companyType').reset(); // Reset the area field
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
          
                      // Last Name
                      ResponsiveGridCol(
                        lg: lg,
                        md: md,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ReactiveForm(
                              formGroup: otherDetailsForm,
                              child: Column(
                                children: [
                                  ReactiveTextField<String>(
                                    formControlName: 'tradeApprovalNumber',
                                    decoration: InputDecoration(
                                      labelText: lang.tradeApprovalNumber,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: lg,
                        md: md,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ReactiveForm(
                              formGroup: otherDetailsForm,
                              child: Column(
                                children: [
                                  ReactiveTextField<String>(
                                    formControlName: 'dateStarted',
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
                                              otherDetailsForm
                                                  .control('dateStarted')
                                                  .value = formatDate(pickedDate);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      // Country Dropdown
                      ResponsiveGridCol(
                        lg: lg,
                        md: md,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ReactiveForm(
                              formGroup: otherDetailsForm,
                              child: Column(
                                children: [
                                  ReactiveTextField<String>(
                                    formControlName: 'contactName',
                                    decoration: InputDecoration(
                                      labelText: lang.contactName,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
          
                      ResponsiveGridCol(
                        lg: lg,
                        md: md,
                        child: Padding(
                          padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                          child: ReactiveForm(
                              formGroup: otherDetailsForm,
                              child: Column(
                                children: [
                                  ReactiveTextField<String>(
                                    formControlName: 'companyCivilId',
                                    decoration: InputDecoration(
                                      labelText: lang.companyCivilId,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
          
                      ResponsiveGridCol(child: Text('')),
          
                      // Save Form Button
          
                      // ResponsiveGridCol(
                      //   lg: 2,
                      //   md: 3,
                      //   xl: 2,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      //     child: ElevatedButton.icon(
                      //       icon: Icon(
                      //         Icons.arrow_back_rounded,
                      //         size: 17,
                      //         color: FinanceAppColors.kWhiteColor,
                      //       ),
                      //       onPressed: () {
                      //         widget.tabController.animateTo(2);
                      //       },
                      //       //child: const Text('Save From'),
                      //       label: Text(lang.previous),
                      //     ),
                      //   ),
                      // ),
                      // ResponsiveGridCol(
                      //   lg: 2,
                      //   md: 3,
                      //   xl: 2,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      //     child: ElevatedButton.icon(
                      //       icon: Icon(
                      //         Icons.arrow_forward_rounded,
                      //         size: 17,
                      //         color: FinanceAppColors.kWhiteColor,
                      //       ),
                      //       onPressed: () {
                      //         if (otherDetailsForm.touched) {
                      //           widget.tabController.animateTo(4);
                      //           // print('Form Value: ${otherDetailsForm.value}');
                      //         } else {
                      //           otherDetailsForm.markAllAsTouched();
                      //         }
                      //       },
                      //       //child: const Text('Save From'),
                      //       label: Text(lang.next),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizeInfo.innerSpacing),
            ],
          ),
          ),
          Expanded(
            flex: 6,
            child: UploadPage(tabController: widget.tabController))
          
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
