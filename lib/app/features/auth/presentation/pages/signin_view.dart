// 🐦 Flutter imports:
import 'package:feather_icons/feather_icons.dart';
import 'package:vendor_registration/app/core/helpers/fuctions/_get_image.dart';
import 'package:vendor_registration/app/core/static/_static_image.dart';
import 'package:vendor_registration/app/features/auth/domain/entities/user_rights.dart';
import 'package:vendor_registration/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:vendor_registration/app/features/auth/presentation/pages/signup_view.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/_personal_details.dart';
import 'package:vendor_registration/app/features/registration/presentation/pages/registration/register_page_view.dart';
import 'package:vendor_registration/app/models/_variable_model.dart';
import 'package:vendor_registration/app/widgets/company_header/_company_header.dart';
import 'package:vendor_registration/app/widgets/textfield_wrapper/_textfield_wrapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../generated/l10n.dart' as l;

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  late final Logger logger;
  final _userUserNameController = TextEditingController();
  final _userPasswordController = TextEditingController();
  bool rememberMe = false;
  bool showPassword = false;
  final signInFormKey = GlobalKey<FormState>();
  List<String> list = <String>[];
  // List<AppSetting> appsetting = [];
  List<UserRights>? userRights = [];

  @override
  void initState() {
    logger = Logger(runtimeType.toString());
    logger.info('SigninView initialized');
    super.initState();
  }

  @override
  void dispose() {
    _userUserNameController.dispose();
    _userPasswordController.dispose();
    logger.info('SigninView disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<AppSettingBloc>().add(AppSettingsListEvent());
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

    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        //print(state);
        // TODO: implement listener

        if (state is AuthErrorState) {
          if (!state.message.contains('401')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            VariableModal.username = _userUserNameController.text;
            VariableModal.password = _userPasswordController.text;
            // ignore: unnecessary_null_comparison, unrelated_type_equality_checks

            if (state.message == 'User is awaitng approval.') {
              context.go('/authentication/signin');
            }
          }

          if (state.message == 'User needs registration') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupView()));
          }

          if (state.message == 'Email is not confirmed') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Your email is not Confirmed'),
              ),
            );
          }

          if (state.message.contains('401')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Invalid Username or Password'),
              ),
            );
          }
        }

        if (state is AuthenticatedState) {
          //print(state.token.accessToken);
          /* context.go('/authentication/services_list', extra: userRights); */
          context.goNamed('home');
        }
      },
      child: GestureDetector(
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

                        // Sign in form
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoadingState) {
                              return Flexible(
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            return Flexible(
                              child: Form(
                                key: signInFormKey,
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 375),
                                  child: Center(
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            lang.signIn,
                                            //'Sign in',
                                            style: theme.textTheme.headlineSmall
                                                ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),

                                          const SizedBox(height: 20),

                                          // Divider

                                          // Email Field
                                          TextFieldLabelWrapper(
                                            //labelText: 'Email',
                                            labelText: lang.email,
                                            inputField: TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                //hintText: 'Enter your email address',
                                                hintText:
                                                    lang.enterYourEmailAddress,
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  // return 'Please enter your first name';
                                                  return lang
                                                      .enterYourEmailAddress;
                                                }
                                                String pattern =
                                                    r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                                                RegExp regex = RegExp(pattern);

                                                if (!regex.hasMatch(value)) {
                                                  return lang
                                                      .enterValidEmailAddress;
                                                }

                                                return null;
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller:
                                                  _userUserNameController,
                                            ),
                                          ),
                                          const SizedBox(height: 20),

                                          // Password Field
                                          TextFieldLabelWrapper(
                                            //labelText: 'Password',
                                            labelText: lang.password,
                                            inputField: TextFormField(
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              obscureText: !showPassword,
                                              decoration: InputDecoration(
                                                //hintText: 'Enter your password',
                                                hintText:
                                                    lang.enterYourPassword,
                                                suffixIcon: IconButton(
                                                  onPressed: () => setState(
                                                    () => showPassword =
                                                        !showPassword,
                                                  ),
                                                  icon: Icon(
                                                    showPassword
                                                        ? FeatherIcons.eye
                                                        : FeatherIcons.eyeOff,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  // return 'Please enter your first name';
                                                  return lang.enterYourPassword;
                                                }

                                                return null;
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              controller:
                                                  _userPasswordController,
                                            ),
                                          ),
                                          const SizedBox(height: 20),

                                          // Remember Me / Forgot Password
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Remember Me
                                              Flexible(
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        alignment:
                                                            PlaceholderAlignment
                                                                .middle,
                                                        child: SizedBox.square(
                                                          dimension: 16,
                                                          child: Checkbox(
                                                            value: rememberMe,
                                                            onChanged:
                                                                (value) =>
                                                                    setState(
                                                              () => rememberMe =
                                                                  value!,
                                                            ),
                                                            visualDensity:
                                                                const VisualDensity(
                                                              horizontal: -4,
                                                              vertical: -2,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const WidgetSpan(
                                                        child:
                                                            SizedBox(width: 6),
                                                      ),
                                                      TextSpan(
                                                        // text: 'Remember Me',
                                                        text: lang.rememberMe,
                                                        mouseCursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () =>
                                                                  setState(
                                                                    () => rememberMe =
                                                                        !rememberMe,
                                                                  ),
                                                      ),
                                                    ],
                                                  ),
                                                  style: theme
                                                      .textTheme.labelLarge
                                                      ?.copyWith(
                                                    color: theme.checkboxTheme
                                                        .side?.color,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),

                                          // Submit Button
                                          SizedBox(
                                            width: double.maxFinite,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (signInFormKey.currentState!
                                                    .validate()) {
                                                  context.read<AuthBloc>().add(
                                                        AuthSignInEvent(
                                                          userName:
                                                              _userUserNameController
                                                                  .text,
                                                          password:
                                                              _userPasswordController
                                                                  .text,
                                                        ),
                                                      );
                                                }
                                              },
                                              // child: const Text('Sign In'),
                                              child: Text(lang.signIn),
                                            ),
                                            
                                          ),
                                          const SizedBox(height: 20),
                                          Center(child: InkWell(
                                            child: Text(lang.registerHere),
                                            onTap: (){
                //                               Navigator.push(
                // context, MaterialPageRoute(builder: (context) => RegisterForm()));
                context.go('/authentication/register');
                                            },
                                          ),),
                                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
      ),
    );
  }
}
