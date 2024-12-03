// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/core/helpers/field_styles/_dropdown_styles.dart';
import 'package:vendor_registration/app/widgets/checkbox_form_field/_checkbox_form_field.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';
import 'package:vendor_registration/app/widgets/textfield_wrapper/_textfield_wrapper.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({super.key});

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
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
              headerText: lang.browserDefaults,
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'First Name',
                        labelText: lang.firstName,
                        inputField: TextFormField(
                          decoration: InputDecoration(
                            //hintText: 'Enter your first name',
                            hintText: lang.enterYourFirstName,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please enter your first name';
                              return lang.pleaseEnterYourFirstName;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Last Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Last Name',
                        labelText: lang.lastName,
                        inputField: TextFormField(
                          decoration: InputDecoration(
                            //hintText: 'Enter your last name',
                            hintText: lang.enterYourLastName,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //return 'Please enter your last name';
                              return lang.pleaseEnterYourLastName;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Country',
                        labelText: lang.country,
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: dropdownStyle.menuItemStyle,
                          buttonStyleData: dropdownStyle.buttonStyle,
                          iconStyleData: dropdownStyle.iconStyle,
                          dropdownStyleData: dropdownStyle.dropdownStyle,
                          //hint: const Text('Select Country'),
                          hint: Text(lang.selectCountry),
                          items: [
                            "Canada",
                            "Brazil",
                            "Germany",
                            "Australia",
                            "Japan",
                            "India",
                            "South Africa",
                            "Mexico",
                            "France",
                            "South Korea"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //return 'Please select your country';
                              return lang.pleaseSelectYourCountry;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // City Dropdown
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'City',
                        labelText: lang.city,
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: dropdownStyle.menuItemStyle,
                          buttonStyleData: dropdownStyle.buttonStyle,
                          iconStyleData: dropdownStyle.iconStyle,
                          dropdownStyleData: dropdownStyle.dropdownStyle,
                          //hint: const Text('Select City'),
                          hint: Text(lang.selectCity),
                          items: [
                            "Toronto",
                            "São Paulo",
                            "Berlin",
                            "Sydney",
                            "Tokyo",
                            "Mumbai",
                            "Cape Town",
                            "Mexico City",
                            "Paris",
                            "Seoul"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //return 'Please select your city';
                              return lang.pleaseSelectYourCity;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // State Dropdown
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'State',
                        labelText: lang.state,
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: dropdownStyle.menuItemStyle,
                          buttonStyleData: dropdownStyle.buttonStyle,
                          iconStyleData: dropdownStyle.iconStyle,
                          dropdownStyleData: dropdownStyle.dropdownStyle,
                          // hint: const Text('Select State'),
                          hint: Text(lang.selectState),
                          items: [
                            "Ontario",
                            "São Paulo",
                            "Berlin",
                            "New South Wales",
                            "Tokyo Metropolis",
                            "Maharashtra",
                            "Western Cape",
                            "Mexico City",
                            "Île-de-France",
                            "Seoul Capital Area"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //return 'Please select your state';
                              return lang.pleaseSelectYourState;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Check Box
                  ResponsiveGridCol(
                    lg: 12,
                    md: 12,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FinanceCheckBoxFormField(
                        // title: const Text('Agree to terms and conditions'),
                        title: Text(lang.agreeToTermsAndConditions),
                        validator: (value) {
                          if (value == null || !value) {
                            //return 'Please check this box to continue';
                            return lang.pleaseCheckThisBoxToContinue;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),

                  // Save Form Button
                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ElevatedButton(
                        onPressed: () {
                          if (browserDefaultFormKey.currentState?.validate() ==
                              true) {
                            browserDefaultFormKey.currentState?.save();
                          }
                        },
                        //child: const Text('Save From'),
                        child: Text(lang.saveFrom),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sizeInfo.innerSpacing),

          // Custom Form
          Form(
            key: customFormKey,
            child: ShadowContainer(
              // headerText: 'Custom Styles',
              headerText: lang.customStyles,
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'First Name',
                        labelText: lang.firstName,
                        inputField: TextFormField(
                          decoration: InputDecoration(
                            //hintText: 'Enter your first name',
                            hintText: lang.enterYourFirstName,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please enter your first name';
                              return lang.pleaseEnterYourFirstName;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Last Name
                  ResponsiveGridCol(
                    lg: lg + 2,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        //labelText: 'Last Name',
                        labelText: lang.lastName,
                        inputField: TextFormField(
                          decoration: InputDecoration(
                            //hintText: 'Enter your last name',
                            hintText: lang.enterYourLastName,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please enter your last name';
                              return lang.pleaseEnterYourLastName;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        // labelText: 'Country',
                        labelText: lang.country,
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: dropdownStyle.menuItemStyle,
                          buttonStyleData: dropdownStyle.buttonStyle,
                          iconStyleData: dropdownStyle.iconStyle,
                          dropdownStyleData: dropdownStyle.dropdownStyle,
                          // hint: const Text('Select Country'),
                          hint: Text(lang.selectCountry),
                          items: [
                            "Canada",
                            "Brazil",
                            "Germany",
                            "Australia",
                            "Japan",
                            "India",
                            "South Africa",
                            "Mexico",
                            "France",
                            "South Korea"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please select your country';
                              return lang.pleaseSelectYourCountry;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // City Dropdown
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        // labelText: 'City',
                        labelText: lang.city,
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: dropdownStyle.menuItemStyle,
                          buttonStyleData: dropdownStyle.buttonStyle,
                          iconStyleData: dropdownStyle.iconStyle,
                          dropdownStyleData: dropdownStyle.dropdownStyle,
                          //hint: const Text('Select City'),
                          hint: Text(lang.selectCity),
                          items: [
                            "Toronto",
                            "São Paulo",
                            "Berlin",
                            "Sydney",
                            "Tokyo",
                            "Mumbai",
                            "Cape Town",
                            "Mexico City",
                            "Paris",
                            "Seoul"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //return 'Please select your city';
                              return lang.pleaseSelectYourCity;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // State Dropdown
                  ResponsiveGridCol(
                    lg: lg,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        // labelText: 'State',
                        labelText: lang.state,
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: dropdownStyle.menuItemStyle,
                          buttonStyleData: dropdownStyle.buttonStyle,
                          iconStyleData: dropdownStyle.iconStyle,
                          dropdownStyleData: dropdownStyle.dropdownStyle,
                          // hint: const Text('Select State'),
                          hint: Text(lang.selectState),
                          items: [
                            "Ontario",
                            "São Paulo",
                            "Berlin",
                            "New South Wales",
                            "Tokyo Metropolis",
                            "Maharashtra",
                            "Western Cape",
                            "Mexico City",
                            "Île-de-France",
                            "Seoul Capital Area"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              // return 'Please select your state';
                              return lang.pleaseSelectYourState;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Check Box
                  ResponsiveGridCol(
                    lg: 12,
                    md: 12,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FinanceCheckBoxFormField(
                        // title: const Text('Agree to terms and conditions'),
                        title: Text(lang.agreeToTermsAndConditions),
                        validator: (value) {
                          if (value == null || !value) {
                            // return 'Please check this box to continue';
                            return lang.pleaseCheckThisBoxToContinue;
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),

                  // Save Form Button
                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ElevatedButton(
                        onPressed: () {
                          if (customFormKey.currentState?.validate() == true) {
                            customFormKey.currentState?.save();
                          }
                        },
                        //child: const Text('Save From'),
                        child: Text(lang.saveFrom),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
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
