// 🐦 Flutter imports:

import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/presentation/bloc/registration_bloc.dart';
import 'package:vendor_registration/app/widgets/textfield_wrapper/_textfield_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class AddRegistrationDialog extends StatefulWidget {
  const AddRegistrationDialog({super.key});

  @override
  State<AddRegistrationDialog> createState() => _AddRegistrationDialogState();
}

class _AddRegistrationDialogState extends State<AddRegistrationDialog> {
  late final Logger logger;
  final _registrationNameController = TextEditingController();
  final registrationCreationFormKey = GlobalKey<FormState>();

  // late List<Sector> sectors = [];
  late List<Registration> sectorRegistrations = [];
  String? selectedSectorId;
  late List<Registration> registrations = [];

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
    // context.read<SectorBloc>().add(SectorsListEvent());
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
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is RegistrationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is RegistrationCreateState) {
          if (listenerState.registration.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration Created Successfully'),
              ),
            );
            // refresh the user list
            listenerContext
                .read<RegistrationBloc>()
                .add(RegistrationsListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Registration Creation Failed'),
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
        content: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (blocContext, blocState) {
            return SingleChildScrollView(
              child: Form(
                key: registrationCreationFormKey,
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
                          Text(lang.newRegistration),
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
                        width: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),

                            ///---------------- Text Field section
                            // Text(lang.name, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFieldLabelWrapper(
                              labelText: lang.name,
                              labelStyle: textTheme.bodySmall,
                              inputField: TextFormField(
                                decoration: InputDecoration(
                                  hintText: lang.name,
                                  hintStyle: textTheme.bodySmall,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // return 'Please enter your first name';
                                    return lang.name;
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _registrationNameController,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // TextFieldLabelWrapper(
                            //     // labelText: 'Email',
                            //     labelText: lang.sector,
                            //     labelStyle: textTheme.bodySmall,
                            //     inputField:
                            //         BlocBuilder<SectorBloc, SectorState>(
                            //             builder: (dContext, dState) {
                            //       if (dState is SectorsListState) {
                            //         sectors = dState.sectors;
                            //         // sectorRegistrations = Registrations
                            //         //     .where((element) =>
                            //         //         element.sectorId.toString() ==
                            //         //         selectedSectorId)
                            //         //     .toList();
                            //       }

                            //       return DropdownButtonFormField<String>(
                            //         value: selectedSectorId,
                            //         hint: Text('Select any Sector'),
                            //         onChanged: (sectValue) {
                            //           setState(() {
                            //             selectedSectorId = sectValue;
                            //           });
                            //         },
                            //         validator: (value) {
                            //           if (value?.isEmpty ?? true) {
                            //             return 'This field cannot be left empty';
                            //           }
                            //           return null;
                            //         },
                            //         items: sectors
                            //             .map<DropdownMenuItem<String>>(
                            //                 (sectValue) {
                            //           return DropdownMenuItem<String>(
                            //               value: sectValue.id.toString(),
                            //               child:
                            //                   Text(sectValue.name.toString()));
                            //         }).toList(),
                            //       );
                            //     })),

                            ///---------------- Submit Button section
                            const SizedBox(height: 16),
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
                                      if (registrationCreationFormKey
                                          .currentState!
                                          .validate()) {
                                        blocContext
                                            .read<RegistrationBloc>()
                                            .add(
                                              RegistrationCreateEvent(
                                                Registration(
                                                  fullName:
                                                      _registrationNameController
                                                          .text,
                                                  id: 0,
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
