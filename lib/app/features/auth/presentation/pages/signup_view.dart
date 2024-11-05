// 🐦 Flutter imports:
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/models/_variable_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// 📦 Package imports:
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
// 🌎 Project imports:
import '../../../../../generated/l10n.dart' as l;
import '../../../../core/helpers/fuctions/helper_functions.dart';
import '../../../../core/static/static.dart';
import '../../../../widgets/widgets.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool showPassword = false;
  String loginEmail = '';

  late List<Sector> sector = [];
  late List<Department> department = [];
  String? selectedSector;
  String? selectedDept;
  String? selectedSection;

  // List<String>? getSubItems() {
  //   return selectedSector == null ? [] : items[selectedSector];
  // }

  @override
  void initState() {
    super.initState();
    List<String?> items = sector.map((item) => item.name).toList();

    // loginPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    context.read<SectorBloc>().add(SectorsListEvent());
    context.read<DepartmentBloc>().add(DepartmentsListEvent());
    final lang = l.S.of(context);
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;

    final desktopView = screenWidth >= 1200;

    final ssoButtonStyle = OutlinedButton.styleFrom(
      side: BorderSide(
        color: theme.colorScheme.outline,
      ),
      foregroundColor: theme.colorScheme.onTertiary,
      padding: rf.ResponsiveValue<EdgeInsetsGeometry?>(
        context,
        conditionalValues: [
          const rf.Condition.between(
            start: 0,
            end: 576,
            value: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ],
      ).value,
    );

    String? selectedValue;
    String? section;

    // return BlocBuilder<SectorBloc, SectorState>(builder: (context, state) {
    //   if (state is SectorsListState) {
    //     sector = state.sectors;
    //   }
    //   return BlocBuilder<DepartmentBloc, DepartmentState>(
    //       builder: (context, state) {
    //     if (state is DepartmentsListState) {
    //       departments = state.departments;
    //       print(departments);
    //     }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Row(
          children: [
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: desktopView ? (screenWidth * 0.45) : screenWidth,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      // Header With Logo
                      const CompanyHeaderWidget(),

                      // Sign up form
                      Flexible(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 375),
                          child: Center(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    lang.signUp,
                                    //'Sign up',
                                    style:
                                        theme.textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  Text.rich(
                                    TextSpan(
                                      //text: 'Already have an account? ',
                                      text: lang.alreadyHaveAnAccount,
                                      children: [
                                        TextSpan(
                                          // text: 'Sign in',
                                          text: lang.signIn,
                                          style: theme.textTheme.labelLarge
                                              ?.copyWith(
                                            color: theme.colorScheme.primary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              context.push(
                                                '/authentication/signin',
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                    style: theme.textTheme.labelLarge?.copyWith(
                                      color: theme.checkboxTheme.side?.color,
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  // SSO Login Buttons
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Flexible(
                                      //   child: OutlinedButton.icon(
                                      //     onPressed: () {},
                                      //     //label: const Text('Use Google'),
                                      //     label: Text(lang.useGoogle),
                                      //     icon: getImageType(
                                      //       FinanceStaticImage.googleIcon,
                                      //       height: 14,
                                      //       width: 14,
                                      //     ),
                                      //     style: ssoButtonStyle,
                                      //   ),
                                      // ),
                                      // const SizedBox(width: 10),
                                      // Flexible(
                                      //   child: OutlinedButton.icon(
                                      //     onPressed: () {},
                                      //     // label: const Text('Use Apple'),
                                      //     label: Text(lang.useApple),
                                      //     icon: getImageType(
                                      //       FinanceStaticImage.appleIcon,
                                      //       height: 14,
                                      //       width: 14,
                                      //     ),
                                      //     style: ssoButtonStyle,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),

                                  // Divider
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // Flexible(
                                      //   child: Container(
                                      //     height: 1,
                                      //     color: theme.colorScheme.outline,
                                      //   ),
                                      // ),
                                      // const SizedBox(width: 10),
                                      // Text(
                                      //   lang.or,
                                      //   // 'or',
                                      //   style: theme.textTheme.bodyMedium
                                      //       ?.copyWith(),
                                      // ),
                                      // const SizedBox(width: 10),
                                      // Flexible(
                                      //   child: Container(
                                      //     height: 1,
                                      //     color: theme.colorScheme.outline,
                                      //   ),
                                      // )
                                    ],
                                  ),

                                  // Full Name Field
                                  TextFieldLabelWrapper(
                                    //labelText: 'Full Name',
                                    labelText: lang.fullName,
                                    inputField: TextFormField(
                                      decoration: InputDecoration(
                                        // hintText: 'Enter full name',
                                        hintText: lang.enterFullName,
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(height: 20),
                                  // Email Field
                                  // TextFieldLabelWrapper(
                                  //   // labelText: 'Email',
                                  //   labelText: lang.email,
                                  //   inputField: TextFormField(
                                  //     initialValue: VariableModal.username,
                                  //     decoration: InputDecoration(
                                  //       //hintText: 'Enter email address',
                                  //       hintText: lang.enterEmailAddress,
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(height: 20),
                                  TextFieldLabelWrapper(
                                    //labelText: 'Full Name',
                                    labelText: lang.phone,
                                    inputField: TextFormField(
                                      decoration: InputDecoration(
                                        // hintText: 'Enter full name',
                                        hintText: lang.phone,
                                      ),
                                    ),
                                  ),
                                  // const SizedBox(height: 20),
                                  // TextFieldLabelWrapper(
                                  //   //labelText: 'Full Name',
                                  //   labelText: lang.officePhoneNumber,
                                  //   inputField: TextFormField(
                                  //     decoration: InputDecoration(
                                  //       // hintText: 'Enter full name',
                                  //       hintText: lang.officePhoneNumber,
                                  //     ),
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 20),
                                  // TextFieldLabelWrapper(
                                  //   //labelText: 'Full Name',
                                  //   labelText: lang.description,
                                  //   inputField: TextFormField(
                                  //     decoration: InputDecoration(
                                  //       // hintText: 'Enter full name',
                                  //       hintText: lang.description,
                                  //     ),
                                  //   ),
                                  // ),

                                  const SizedBox(height: 20),
                                  TextFieldLabelWrapper(
                                      // labelText: 'Email',
                                      labelText: lang.sector,
                                      inputField:
                                          BlocBuilder<SectorBloc, SectorState>(
                                              builder: (context, state) {
                                        if (state is SectorsListState) {
                                          sector = state.sectors;
                                        }
                                        return DropdownButtonFormField<String>(
                                          value: selectedValue,
                                          hint: Text('Select any sector'),
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedValue = newValue;
                                            });
                                          },
                                          validator: (value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'This field cannot be left empty';
                                            }
                                            return null;
                                          },
                                          // items: [],

                                          items: sector
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                            return DropdownMenuItem<String>(
                                                value: value.id.toString(),
                                                child: Text(
                                                    value.name.toString()));
                                          }).toList(),
                                        );
                                      })),
                                  const SizedBox(height: 20),

                                  TextFieldLabelWrapper(
                                      // labelText: 'Email',
                                      labelText: lang.department,
                                      inputField: BlocBuilder<DepartmentBloc,
                                              DepartmentState>(
                                          builder: (context, state) {
                                        if (state is DepartmentsListState) {
                                          department = state.departments;
                                          print(department);
                                        }
                                        return DropdownButtonFormField<String>(
                                          value: selectedDept,
                                          hint: Text('Select any department'),
                                          onChanged: (newValue) {
                                            setState(() {
                                              selectedDept = newValue;
                                            });
                                          },
                                          validator: (value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'This field cannot be left empty';
                                            }
                                            return null;
                                          },
                                          // items: [],

                                          items: department
                                              .map<DropdownMenuItem<String>>(
                                                  (value) {
                                            return DropdownMenuItem<String>(
                                                value: value.id.toString(),
                                                child: Text(
                                                    value.name.toString()));
                                          }).toList(),
                                        );
                                      })),

                                  const SizedBox(height: 20),
                                  TextFieldLabelWrapper(
                                      // labelText: 'Email',
                                      labelText: lang.section,
                                      inputField:
                                          DropdownButtonFormField<String>(
                                        value: selectedSection,
                                        hint: Text('Select any section'),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedSection = newValue;
                                          });
                                        },
                                        validator: (value) {
                                          if (value?.isEmpty ?? true) {
                                            return 'This field cannot be left empty';
                                          }
                                          return null;
                                        },
                                        // items: [],

                                        items: department
                                            .map<DropdownMenuItem<String>>(
                                                (value) {
                                          return DropdownMenuItem<String>(
                                              value: value.toString(),
                                              child: Text(value.toString()));
                                        }).toList(),
                                      )),

                                  // Password Field
                                  // TextFieldLabelWrapper(
                                  //   //labelText: 'Password',
                                  //   labelText: lang.password,
                                  //   inputField: TextFormField(
                                  //     obscureText: !showPassword,
                                  //     decoration: InputDecoration(
                                  //       //hintText: 'Enter your password',
                                  //       hintText: lang.enterYourPassword,
                                  //       suffixIcon: IconButton(
                                  //         onPressed: () => setState(
                                  //           () => showPassword = !showPassword,
                                  //         ),
                                  //         icon: Icon(
                                  //           showPassword
                                  //               ? FeatherIcons.eye
                                  //               : FeatherIcons.eyeOff,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(height: 20),

                                  // Submit Button
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      //child: const Text('Sign Up'),
                                      child: Text(lang.signUp),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Cover Image
            if (desktopView)
              Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.55,
                  maxHeight: double.maxFinite,
                ),
                decoration: BoxDecoration(
                    // color: theme.colorScheme.tertiaryContainer,
                    ),
                child: getImageType(
                  FinanceStaticImage.signUpCover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.fill,
                ),
              ),
          ],
        ),
      ),
    );
    //   });
    // });
  }
}
