// 🐦 Flutter imports:
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/presentation/bloc/section_bloc.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/widgets/textfield_wrapper/_textfield_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class AddSectionDialog extends StatefulWidget {
  const AddSectionDialog({super.key});

  @override
  State<AddSectionDialog> createState() => _AddSectionDialogState();
}

class _AddSectionDialogState extends State<AddSectionDialog> {
  late final Logger logger;
  final _sectionNameController = TextEditingController();
  final sectionCreationFormKey = GlobalKey<FormState>();
  late List<Department> departments = [];
  late List<Sector> sectors = [];
  late List<Department> sectorDepartments = [];
  String? selectedDeptId;
  String? selectedSectorId;

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
    context.read<SectorBloc>().add(SectorsListEvent());
    context.read<DepartmentBloc>().add(DepartmentsListEvent());
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
    return BlocListener<SectionBloc, SectionState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is SectionError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is SectionCreateState) {
          if (listenerState.section.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Section Created Successfully'),
              ),
            );
            // refresh the user list
            listenerContext.read<SectionBloc>().add(SectionsListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Section Creation Failed'),
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
        content: BlocBuilder<SectionBloc, SectionState>(
          builder: (blocContext, blocState) {
            return SingleChildScrollView(
              child: Form(
                key: sectionCreationFormKey,
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
                          Text(lang.addNewSection),
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
                                controller: _sectionNameController,
                              ),
                            ),

                            const SizedBox(height: 24),
                            TextFieldLabelWrapper(
                                // labelText: 'Email',
                                labelText: lang.sector,
                                labelStyle: textTheme.bodySmall,
                                inputField:
                                    BlocBuilder<SectorBloc, SectorState>(
                                        builder: (context, state) {
                                  if (state is SectorsListState) {
                                    sectors = state.sectors;
                                  }
                                  return DropdownButtonFormField<String>(
                                    value: selectedSectorId,
                                    hint: Text('Select any sector'),
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedSectorId = newValue;
                                        selectedDeptId = null;
                                      });
                                      context
                                          .read<DepartmentBloc>()
                                          .add(DepartmentsListEvent());
                                    },
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'This field cannot be left empty';
                                      }
                                      return null;
                                    },
                                    // items: [],

                                    items: sectors
                                        .map<DropdownMenuItem<String>>(
                                            (sectorValue) {
                                      return DropdownMenuItem<String>(
                                          value: sectorValue.id.toString(),
                                          child: Text(
                                              sectorValue.name.toString()));
                                    }).toList(),
                                  );
                                })),
                            const SizedBox(height: 24),
                            TextFieldLabelWrapper(
                                // labelText: 'Email',
                                labelText: lang.department,
                                labelStyle: textTheme.bodySmall,
                                inputField: BlocBuilder<DepartmentBloc,
                                        DepartmentState>(
                                    builder: (dContext, dState) {
                                  if (dState is DepartmentsListState) {
                                    departments = dState.departments;
                                    sectorDepartments = departments
                                        .where((element) =>
                                            element.sectorId.toString() ==
                                            selectedSectorId)
                                        .toList();
                                  }

                                  return DropdownButtonFormField<String>(
                                    value: selectedDeptId,
                                    hint: Text('Select any department'),
                                    onChanged: (deptValue) {
                                      setState(() {
                                        selectedDeptId = deptValue;
                                      });
                                    },
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'This field cannot be left empty';
                                      }
                                      return null;
                                    },
                                    items: sectorDepartments
                                        .map<DropdownMenuItem<String>>(
                                            (depValue) {
                                      return DropdownMenuItem<String>(
                                          value: depValue.id.toString(),
                                          child:
                                              Text(depValue.name.toString()));
                                    }).toList(),
                                  );
                                })),

                            ///---------------- Submit Button section
                            const SizedBox(height: 24),
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
                                      if (sectionCreationFormKey.currentState!
                                          .validate()) {
                                        blocContext.read<SectionBloc>().add(
                                              SectionCreateEvent(
                                                Section(
                                                  name: _sectionNameController
                                                      .text,
                                                  departmentId: 1,
                                                  id: null,
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
