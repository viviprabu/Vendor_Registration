// 🐦 Flutter imports:
import 'package:finance_app/app/common/widgets/toggle_switch_field/toggle_switcher.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_bloc.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_event.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class AddInitialUploadDialog extends StatefulWidget {
  const AddInitialUploadDialog({super.key});

  @override
  State<AddInitialUploadDialog> createState() => _AddInitialUploadDialogState();
}

class _AddInitialUploadDialogState extends State<AddInitialUploadDialog> {
  late final Logger logger;
  final _InitialUploadEmailController = TextEditingController();
  final _InitialUploadPasswordController = TextEditingController();
  final _InitialUploadNameController = TextEditingController();
  final _InitialUploadPhoneNumberController = TextEditingController();
  final _InitialUploadMobileNumberController = TextEditingController();
  final _InitialUploadOfficePhoneController = TextEditingController();
  final _InitialUploadDescriptionController = TextEditingController();
  final _InitialUploadLogoPathController = TextEditingController();
  final _InitialUploadLogoFileController = TextEditingController();

  int? _selectedRole;
  int? _selectedLanguage;
  int? _selectedBusinessRole;
  int toggleValue = 0;
  int isDarkMode = 1;

  final InitialUploadCreationFormKey = GlobalKey<FormState>();

  List<Map<int, String>> get _language => [
        {1: 'English'},
        {2: 'Arabic'},
      ];

  List<Map<int, String>> get _businessRole => [
        {1: 'admin'},
        {2: 'InitialUpload'},
      ];

  List<Map<int, String>> get _InitialUploadRoles => [
        {1: 'admin'},
        {2: 'InitialUpload'},
      ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
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
    return BlocListener<InitialUploadBloc, InitialUploadState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is InitialUploadError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is InitialUploadCreateState) {
          if (listenerState.initialUpload.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('InitialUpload Created Successfully'),
              ),
            );
            // refresh the InitialUpload list
            listenerContext
                .read<InitialUploadBloc>()
                .add(InitialUploadsListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('InitialUpload Creation Failed'),
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
        content: BlocBuilder<InitialUploadBloc, InitialUploadState>(
          builder: (blocContext, blocState) {
            return SingleChildScrollView(
              child: Form(
                key: InitialUploadCreationFormKey,
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
                          Text(lang.addNewInitialUpload),
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
                                  AutovalidateMode.onInitialUploadInteraction,
                              controller: _InitialUploadNameController,
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
                                  AutovalidateMode.onInitialUploadInteraction,
                              controller: _InitialUploadEmailController,
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
                              controller: _InitialUploadPhoneNumberController,
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
                              controller: _InitialUploadMobileNumberController,
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
                              controller: _InitialUploadOfficePhoneController,
                            ),
                            const SizedBox(height: 20),
                            Text(lang.password, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.enterYourPassword,
                                hintStyle: textTheme.bodySmall,
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // return 'Please enter your first name';
                                  return lang.enterYourPassword;
                                }

                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onInitialUploadInteraction,
                              controller: _InitialUploadPasswordController,
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
                                  AutovalidateMode.onInitialUploadInteraction,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.InitialUploadRole,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<int>(
                              dropdownColor: theme.colorScheme.primaryContainer,
                              value: _selectedRole,
                              hint: Text(
                                lang.selectInitialUploadRole,
                                style: textTheme.bodySmall,
                              ),
                              items: _InitialUploadRoles.map((role) {
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
                              validator: (value) => value == null
                                  ? lang.selectInitialUploadRole
                                  : null,
                              autovalidateMode:
                                  AutovalidateMode.onInitialUploadInteraction,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.InitialUploadBusinessRole,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<int>(
                              dropdownColor: theme.colorScheme.primaryContainer,
                              value: _selectedBusinessRole,
                              hint: Text(
                                lang.selectInitialUploadBusinessRole,
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
                                  ? lang.selectInitialUploadBusinessRole
                                  : null,
                              autovalidateMode:
                                  AutovalidateMode.onInitialUploadInteraction,
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
                              controller: _InitialUploadDescriptionController,
                            ),

                            const SizedBox(height: 20),
                            Text(lang.isDarkMode, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            ToggleSwitcher(
                              activeText: 'Yes',
                              inactiveText: 'No',
                              initialLabelIndex: 1,
                              onToggle: (value) {
                                setState(() {
                                  isDarkMode = value!;
                                });
                              },
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
                                      if (InitialUploadCreationFormKey
                                          .currentState!
                                          .validate()) {
                                        blocContext
                                            .read<InitialUploadBloc>()
                                            .add(
                                              InitialUploadCreateEvent(
                                                InitialUploadCreate(
                                                  name:
                                                      _InitialUploadNameController
                                                          .text,
                                                  email:
                                                      _InitialUploadEmailController
                                                          .text,
                                                  password:
                                                      _InitialUploadPasswordController
                                                          .text,
                                                  mobileNumber:
                                                      _InitialUploadMobileNumberController
                                                          .text,
                                                  phoneNumber:
                                                      _InitialUploadPhoneNumberController
                                                          .text,
                                                  officePhone:
                                                      _InitialUploadOfficePhoneController
                                                          .text,
                                                  roleId:
                                                      _selectedRole!.toInt(),
                                                  businessRoleId:
                                                      _selectedBusinessRole!
                                                          .toInt(),
                                                  isDarkMode: () {
                                                    if (isDarkMode == 0) {
                                                      return true;
                                                    } else {
                                                      return false;
                                                    }
                                                  }(),
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
                                                  logoFileName: 'filename',
                                                  description:
                                                      _InitialUploadDescriptionController
                                                          .text,
                                                  sectionId: '',
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
