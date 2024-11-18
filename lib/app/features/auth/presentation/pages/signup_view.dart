// 🐦 Flutter imports:
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/presentation/bloc/section_bloc.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/features/user/domain/entities/user_create.dart';
import 'package:finance_app/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:finance_app/app/models/_variable_model.dart';
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
  final userCreationFormKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late List<Sector> sector = [];
  late List<Department> departments = [];
  late List<Department> sectorDepartments = [];
  late List<Section> section = [];
  late List<Section> sectionDepartments = [];
  late List<String> language = ['English', 'Arabic'];
  String? selectedSectorId;
  String? selectedDeptId;
  String? selectedSectionId;
  String? selectedLanguageId;
  int? langId;

  // List<String>? getSubItems() {
  //   return selectedSector == null ? [] : items[selectedSector];
  // }

  // @override
  // void initState() {
  //   // loginPassword = widget.password;
  //   super.initState();
  // }

  @override
  void initState() {
    context.read<SectorBloc>().add(SectorsListEvent());

    //context.read<DepartmentBloc>().add(DepartmentsListEvent());
    // loginPassword = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    return BlocListener<UserBloc, UserState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is UserCreateState) {
          if (listenerState.user.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User Registered Successfully'),
              ),
            );
            // refresh the user list
            listenerContext.read<UserBloc>().add(UsersListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User Register Failed'),
              ),
            );
          }
        }
      },
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            body: Row(
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth:
                          desktopView ? (screenWidth * 0.45) : screenWidth,
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
                                        style: theme.textTheme.headlineSmall
                                            ?.copyWith(
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
                                                color:
                                                    theme.colorScheme.primary,
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
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
                                          color:
                                              theme.checkboxTheme.side?.color,
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      // SSO Login Buttons
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                          controller: fullNameController,
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
                                          controller: phoneController,
                                          decoration: InputDecoration(
                                            // hintText: 'Enter full name',
                                            hintText: lang.phone,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      TextFieldLabelWrapper(
                                          // labelText: 'Email',
                                          labelText: lang.language,
                                          inputField:
                                              DropdownButtonFormField<String>(
                                            value: selectedLanguageId,
                                            hint: Text('Select any language'),
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedLanguageId = newValue;
                                              });
                                            },
                                            validator: (value) {
                                              if (value?.isEmpty ?? true) {
                                                return 'This field cannot be left empty';
                                              }
                                              return null;
                                            },
                                            // items: [],

                                            items: language
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          )),

                                      const SizedBox(height: 20),

                                      TextFieldLabelWrapper(
                                          // labelText: 'Email',
                                          labelText: lang.sector,
                                          inputField: BlocBuilder<SectorBloc,
                                                  SectorState>(
                                              builder: (context, state) {
                                            if (state is SectorsListState) {
                                              sector = state.sectors;
                                            }
                                            return DropdownButtonFormField<
                                                String>(
                                              value: selectedSectorId,
                                              hint: Text('Select any sector'),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedSectorId = newValue;
                                                  selectedDeptId = null;
                                                });
                                                context
                                                    .read<DepartmentBloc>()
                                                    .add(
                                                        DepartmentsListEvent());
                                              },
                                              validator: (value) {
                                                if (value?.isEmpty ?? true) {
                                                  return 'This field cannot be left empty';
                                                }
                                                return null;
                                              },
                                              // items: [],

                                              items: sector.map<
                                                      DropdownMenuItem<String>>(
                                                  (sectorValue) {
                                                return DropdownMenuItem<String>(
                                                    value: sectorValue.id
                                                        .toString(),
                                                    child: Text(sectorValue.name
                                                        .toString()));
                                              }).toList(),
                                            );
                                          })),
                                      const SizedBox(height: 20),

                                      TextFieldLabelWrapper(
                                          // labelText: 'Email',
                                          labelText: lang.department,
                                          inputField: BlocBuilder<
                                                  DepartmentBloc,
                                                  DepartmentState>(
                                              builder: (dContext, dState) {
                                            if (dState
                                                is DepartmentsListState) {
                                              departments = dState.departments;
                                              sectorDepartments = departments
                                                  .where((element) =>
                                                      element.sectorId
                                                          .toString() ==
                                                      selectedSectorId)
                                                  .toList();
                                            }

                                            return DropdownButtonFormField<
                                                String>(
                                              value: selectedDeptId,
                                              hint:
                                                  Text('Select any department'),
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
                                              items: sectorDepartments.map<
                                                      DropdownMenuItem<String>>(
                                                  (depValue) {
                                                return DropdownMenuItem<String>(
                                                    value:
                                                        depValue.id.toString(),
                                                    child: Text(depValue.name
                                                        .toString()));
                                              }).toList(),
                                            );
                                          })),

                                      const SizedBox(height: 20),

                                      TextFieldLabelWrapper(
                                          // labelText: 'Email',
                                          labelText: lang.section,
                                          inputField: BlocBuilder<SectionBloc,
                                                  SectionState>(
                                              builder: (dContext, dState) {
                                            if (dState is SectionsListState) {
                                              section = dState.sections;
                                              sectionDepartments = section
                                                  .where((element) =>
                                                      element.departmentId
                                                          .toString() ==
                                                      selectedDeptId)
                                                  .toList();
                                            }

                                            return DropdownButtonFormField<
                                                String>(
                                              value: selectedSectionId,
                                              hint: Text('Select any Sections'),
                                              onChanged: (sectValue) {
                                                setState(() {
                                                  selectedSectionId = sectValue;
                                                  // selectedSectionId = null;
                                                });
                                              },
                                              validator: (value) {
                                                if (value?.isEmpty ?? true) {
                                                  return 'This field cannot be left empty';
                                                }
                                                return null;
                                              },
                                              items: sectionDepartments.map<
                                                      DropdownMenuItem<String>>(
                                                  (depValue) {
                                                return DropdownMenuItem<String>(
                                                    value:
                                                        depValue.id.toString(),
                                                    child: Text(depValue.name
                                                        .toString()));
                                              }).toList(),
                                            );
                                          })),

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
                                          onPressed: () {
                                            try {
                                              if (selectedLanguageId ==
                                                  'English') {
                                                langId = 1;
                                              } else {
                                                langId == 2;
                                              }
                                              context.read<UserBloc>().add(
                                                      UserCreateEvent(
                                                          UserCreate(
                                                    name:
                                                        fullNameController.text,
                                                    email:
                                                        VariableModal.username,
                                                    password:
                                                        VariableModal.password,
                                                    phoneNumber:
                                                        phoneController.text,
                                                    roleId: -1,
                                                    mobileNumber: '',
                                                    officePhone: '',
                                                    businessRoleId: 0,
                                                    isDarkMode: false,
                                                    isActive: false,
                                                    languageId: langId,
                                                    logoPath: '',
                                                    logoFileName: '',
                                                    description: '',
                                                    sectionId:
                                                        selectedSectionId,
                                                  )));
                                            } catch (e) {
                                              e.toString();
                                            }
                                          },
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
                      maxWidth: screenWidth * 0.70,
                      maxHeight: double.maxFinite,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.tertiaryContainer,
                    ),
                    child: getImageType(
                      FinanceStaticImage.signInCover,
                      /* fit: BoxFit.contain,
                    height: double.maxFinite, */
                      width: double.maxFinite,
                      height: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
    //   });
    // });
  }
}
