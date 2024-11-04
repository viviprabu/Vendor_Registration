// 🐦 Flutter imports:
import 'package:finance_app/app/common/widgets/toggle_switch_field/toggle_switcher.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:finance_app/app/features/user/domain/entities/user_create.dart';
import 'package:finance_app/app/features/user/domain/entities/user_update.dart';
import 'package:finance_app/app/features/user/domain/usecases/update_user.dart';
import 'package:finance_app/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class EditSectorDialog extends StatefulWidget {
  final Sector sectorData;
  const EditSectorDialog({
    required this.sectorData,
    super.key,
  });

  @override
  State<EditSectorDialog> createState() => _EditSectorDialogState();
}

class _EditSectorDialogState extends State<EditSectorDialog> {
  late final Logger logger;
  final TextEditingController _sectorNameController = TextEditingController();

  final sectorCreationFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    final sectorDetail = widget.sectorData;
    final sectorId = sectorDetail.id ?? 0;
    context.read<SectorBloc>().add(SectorListEvent(sectorId));
    super.initState();
  }

  @override
  void dispose() {
    _sectorNameController.dispose();
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
    return BlocListener<SectorBloc, SectorState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is SectorError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is SectorUpdateState) {
          if (listenerState.sector.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sector Updated Successfully'),
              ),
            );
            // refresh the user list
            listenerContext.read<SectorBloc>().add(SectorsListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sector Creation Failed'),
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
        content: BlocBuilder<SectorBloc, SectorState>(
          builder: (blocContext, blocState) {
            if (blocState is SectorListState) {
              final sectorDetails = blocState.sector;
              _sectorNameController.text = sectorDetails.name ?? '';
            }
            return SingleChildScrollView(
              child: Form(
                key: sectorCreationFormKey,
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
                              controller: _sectorNameController,
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
                                      if (sectorCreationFormKey.currentState!
                                          .validate()) {
                                        blocContext.read<SectorBloc>().add(
                                              SectorUpdateEvent(
                                                Sector(
                                                  id: widget.sectorData.id,
                                                  name: _sectorNameController
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
