// 🐦 Flutter imports:
import 'package:vendor_registration/app/common/widgets/toggle_switch_field/toggle_switcher.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user_update.dart';
import 'package:vendor_registration/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class EditUserDialog extends StatefulWidget {
  final User userData;
  const EditUserDialog({
    required this.userData,
    super.key,
  });

  @override
  State<EditUserDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditUserDialog> {
  late final Logger logger;
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPhoneNumberController =
      TextEditingController();
  final TextEditingController _userMobileNumberController =
      TextEditingController();
  final TextEditingController _userOfficePhoneController =
      TextEditingController();
  final TextEditingController _userDescriptionController =
      TextEditingController();
  final TextEditingController _userSuspendendReasonController =
      TextEditingController();

  int? _selectedRole;
  int? _selectedLanguage;
  int? _selectedBusinessRole;
  final bool _isDarkMode = false;
  final bool _isSuspended = false;
  int toggleValue = 0;

  final userCreationFormKey = GlobalKey<FormState>();

  List<String> get _positions => [
        //'Manager',
        l.S.current.manager,
        //'Developer',
        l.S.current.developer,
        //'Designer',
        l.S.current.designer,
        //'Tester'
        l.S.current.tester,
      ];

  List<Map<int, String>> get _language => [
        {1: 'English'},
        {2: 'Arabic'},
      ];

  List<Map<int, String>> get _businessRole => [
        {1: 'admin'},
        {2: 'user'},
      ];

  List<Map<int, String>> get _userRoles => [
        {1: 'admin'},
        {2: 'user'},
      ];

  @override
  void initState() {
    final userDetail = widget.userData;
    final userId = userDetail.id ?? '';
    context.read<UserBloc>().add(UserListEvent(userId.toString()));
    super.initState();
  }

  @override
  void dispose() {
    _userEmailController.dispose();
    _userNameController.dispose();
    _userPhoneNumberController.dispose();
    _userMobileNumberController.dispose();
    _userOfficePhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = l.S.of(context);
    final sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 480,
          value: _SizeInfo(
            alertFontSize: 12,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 481,
          end: 576,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 577,
          end: 992,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;
    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    return BlocListener<UserBloc, UserState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is UserUpdateState) {
          if (listenerState.user.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User Updated Successfully'),
              ),
            );
            // refresh the user list
            listenerContext.read<UserBloc>().add(UsersListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User Creation Failed'),
              ),
            );
          }
        }
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        content: BlocBuilder<UserBloc, UserState>(
          builder: (blocContext, blocState) {
            if (blocState is UserListState) {
              final userDetails = blocState.user;
              _userEmailController.text = userDetails.email ?? '';
              _userNameController.text = userDetails.name ?? '';
              _userPhoneNumberController.text = userDetails.phoneNumber ?? '';
              _userMobileNumberController.text = userDetails.phoneNumber ?? '';
              _userOfficePhoneController.text = userDetails.phoneNumber ?? '';
            }
            return SingleChildScrollView(
              child: Form(
                key: userCreationFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///---------------- header section
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const Text('Form Dialog'),
                          Text(lang.addNewUser),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: FinanceAppColors.kError,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.1,
                      color: theme.colorScheme.outline,
                      height: 0,
                    ),

                    ///---------------- header section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 1200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),

                            ///---------------- Text Field section
                            Text(lang.name, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: lang.enterYourFullName,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // return 'Please enter your first name';
                                  return lang.pleaseEnterYourFullName;
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _userNameController,
                            ),

                            const SizedBox(height: 20),

                            Text(lang.email, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                //hintText: 'Enter Your Email',
                                hintText: lang.enterYourEmail,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // return 'Please enter your first name';
                                  return lang.enterYourEmailAddress;
                                }
                                String pattern =
                                    r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                                RegExp regex = RegExp(pattern);

                                if (!regex.hasMatch(value)) {
                                  return lang.enterValidEmailAddress;
                                }

                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _userEmailController,
                            ),

                            const SizedBox(height: 20),

                            Text(lang.phoneNumber, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.enterYourPhoneNumber,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _userPhoneNumberController,
                            ),
                            const SizedBox(height: 20),

                            Text(lang.mobileNumber, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.enterYourMobileNo,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _userMobileNumberController,
                            ),
                            const SizedBox(height: 20),

                            Text(lang.officePhoneNumber,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.enterOfficePhoneNumber,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _userOfficePhoneController,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.language, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<int>(
                              dropdownColor: theme.colorScheme.primaryContainer,
                              value: _selectedLanguage,
                              hint: Text(
                                lang.language,
                                //'Select Position',
                                style: textTheme.bodySmall,
                              ),
                              items: _language.map((language) {
                                return DropdownMenuItem<int>(
                                  value: language.keys.first,
                                  child: Text(language.values.first),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedLanguage = value;
                                });
                              },
                              /* validator: (value) =>
                                            value == null ? lang.language : null, */
                              validator: (value) {
                                if (value == null) {
                                  return lang.language;
                                } else {
                                  return null;
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.userRole, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<int>(
                              dropdownColor: theme.colorScheme.primaryContainer,
                              value: _selectedRole,
                              hint: Text(
                                lang.selectUserRole,
                                style: textTheme.bodySmall,
                              ),
                              items: _userRoles.map((role) {
                                return DropdownMenuItem<int>(
                                  value: role.keys.first,
                                  child: Text(role.values.first),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedRole = value;
                                });
                              },
                              validator: (value) =>
                                  value == null ? lang.selectUserRole : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.userBusinessRole,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<int>(
                              dropdownColor: theme.colorScheme.primaryContainer,
                              value: _selectedBusinessRole,
                              hint: Text(
                                lang.selectUserBusinessRole,
                                style: textTheme.bodySmall,
                              ),
                              items: _businessRole.map((bRole) {
                                return DropdownMenuItem<int>(
                                  value: bRole.keys.first,
                                  child: Text(bRole.values.first),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedBusinessRole = value;
                                });
                              },
                              validator: (value) => value == null
                                  ? lang.selectUserBusinessRole
                                  : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.isActive, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            ToggleSwitcher(
                              activeText: lang.active,
                              inactiveText: lang.inactive,
                              onToggle: (value) {
                                setState(() {
                                  toggleValue = value!;
                                });
                              },
                            ),

                            const SizedBox(height: 20),
                            Text(lang.description, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                //hintText: 'Write Something',
                                hintText: lang.description,
                                hintStyle: textTheme.bodySmall,
                              ),
                              maxLines: 3,
                              controller: _userDescriptionController,
                            ),
                            const SizedBox(height: 20),
                            Text(lang.suspendReason,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                //hintText: 'Write Something',
                                hintText: lang.suspendReason,
                                hintStyle: textTheme.bodySmall,
                              ),
                              maxLines: 3,
                              controller: _userSuspendendReasonController,
                            ),
                            const SizedBox(height: 24),

                            ///---------------- Submit Button section
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: sizeInfo.innerSpacing),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: sizeInfo.innerSpacing,
                                        ),
                                        backgroundColor:
                                            theme.colorScheme.primaryContainer,
                                        textStyle: textTheme.bodySmall
                                            ?.copyWith(
                                                color: FinanceAppColors.kError),
                                        side: const BorderSide(
                                            color: FinanceAppColors.kError)),
                                    onPressed: () => Navigator.pop(context),
                                    label: Text(
                                      lang.cancel,
                                      //'Cancel',
                                      style: textTheme.bodySmall?.copyWith(
                                          color: FinanceAppColors.kError),
                                    ),
                                  ),
                                  SizedBox(width: sizeInfo.innerSpacing),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sizeInfo.innerSpacing),
                                    ),
                                    onPressed: () {
                                      if (userCreationFormKey.currentState!
                                          .validate()) {
                                        blocContext.read<UserBloc>().add(
                                              UserUpdateEvent(
                                                UserUpdate(
                                                  id: widget.userData.id,
                                                  name:
                                                      _userNameController.text,
                                                  email:
                                                      _userEmailController.text,
                                                  userName:
                                                      _userEmailController.text,
                                                  mobileNumber:
                                                      _userMobileNumberController
                                                          .text,
                                                  phoneNumber:
                                                      _userPhoneNumberController
                                                          .text,
                                                  officePhone:
                                                      _userOfficePhoneController
                                                          .text,
                                                  homePhone:
                                                      _userPhoneNumberController
                                                          .text,
                                                  isSuspended: _isSuspended,
                                                  suspendReason:
                                                      _userSuspendendReasonController
                                                          .text,
                                                  roleId:
                                                      _selectedRole!.toInt(),
                                                  businessRoleId:
                                                      _selectedBusinessRole!
                                                          .toInt(),
                                                  isDarkMode: _isDarkMode,
                                                  isActive: () {
                                                    if (toggleValue == 0) {
                                                      return true;
                                                    } else {
                                                      return false;
                                                    }
                                                  }(),
                                                  languageId: _selectedLanguage!
                                                      .toInt(),
                                                  logoPath: 'path',
                                                  logoFile: 'filename',
                                                  description:
                                                      _userDescriptionController
                                                          .text,
                                                ),
                                              ),
                                            );
                                      }
                                    },
                                    //label: const Text('Save'),
                                    label: Text(lang.save),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SizeInfo {
  final double? alertFontSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.alertFontSize = 18,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}

// -------------------Dotted Border

class DottedBorderContainer extends StatelessWidget {
  final Widget child;

  const DottedBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:
          DottedBorderPainter(color: Theme.of(context).colorScheme.outline),
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 120,
        width: 120,
        child: Center(child: child),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;

  DottedBorderPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const radius = Radius.circular(5.0);
    const rect = Rect.fromLTWH(0, 0, 120, 120);
    final rrect = RRect.fromRectAndRadius(rect, radius);

    final path = Path()..addRRect(rrect);

    const dashWidth = 4.0;
    const dashSpace = 4.0;

    double distance = 0.0;
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      while (distance < pathMetric.length) {
        final start = distance;
        final end = distance + dashWidth;

        final lineSegment = pathMetric.extractPath(start, end);
        canvas.drawPath(lineSegment, paint);

        distance += dashWidth + dashSpace;
      }
      distance = 0.0; // Reset distance for the next segment
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
