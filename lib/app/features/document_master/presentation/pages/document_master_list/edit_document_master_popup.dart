// 🐦 Flutter imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:vendor_registration/app/common/widgets/toggle_switch_field/toggle_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_update.dart';
import 'package:vendor_registration/app/features/document_master/presentation/bloc/document_master_bloc.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class EditDocumentMasterDialog extends StatefulWidget {
  final DocumentMaster documentMasterData;
  const EditDocumentMasterDialog({
    required this.documentMasterData,
    super.key,
  });

  @override
  State<EditDocumentMasterDialog> createState() => _EditDocumentMasterDialogState();
}

class _EditDocumentMasterDialogState extends State<EditDocumentMasterDialog> {
  late final Logger logger;
 final FormGroup documentMasterForm = FormGroup({
  'nameAr': FormControl<String>(
    validators: [Validators.required],
  ),
  'nameEn': FormControl<String>(    
    validators: [Validators.required],
  ),
  'hasExpiryDate': FormControl<bool>(
    value: false,
    validators: [Validators.required],
  ),
  'isActive': FormControl<bool>(
    value: false,
    validators: [Validators.required],
  ),
  'isMandatory': FormControl<bool>(
    value: false,
    validators: [Validators.required],
  ),
  
});
  int? _selectedRole;
  int? _selectedLanguage;
  int? _selectedBusinessRole;
  final bool _isDarkMode = false;
  final bool _isSuspended = false;
  int toggleValue = 0;

  final documentMasterCreationFormKey = GlobalKey<FormState>();

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
    final documentMasterDetail = widget.documentMasterData;
    final documentMasterId = documentMasterDetail.id ?? '';
    context.read<DocumentMasterBloc>().add(DocumentMasterListEvent(documentMasterId));
    super.initState();
  }

  @override
  void dispose() {
   documentMasterForm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lg = 4;
    const md = 6;
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
    return BlocListener<DocumentMasterBloc, DocumentMasterState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is DocumentMasterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is DocumentMasterUpdateState) {
          if (listenerState.documentMaster.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('DocumentMaster Updated Successfully'),
              ),
            );
            // refresh the DocumentMaster list
            listenerContext.read<DocumentMasterBloc>().add(DocumentMastersListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('DocumentMaster Creation Failed'),
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
        content: BlocBuilder<DocumentMasterBloc, DocumentMasterState>(
          builder: (blocContext, blocState) {
            if (blocState is DocumentMasterListState) {
              final documentMasterDetails = blocState.documentMaster;
              documentMasterForm.controls['nameAr']!.value = documentMasterDetails.nameAr ?? '';
              documentMasterForm.controls['nameEn']!.value = documentMasterDetails.nameEn ?? '';
              documentMasterForm.controls['hasExpiryDate']!.value = documentMasterDetails.hasExpiryDate ?? '';
              documentMasterForm.controls['isActive']!.value = documentMasterDetails.isActive ?? '';
              documentMasterForm.controls['isMandatory']!.value = documentMasterDetails.isMandatory ?? '';
              
            }
            return SingleChildScrollView(
              child: Column(
        // padding: sizeInfo.padding,
        children: [
          // Browser Default Form
          Form(
            key: documentMasterCreationFormKey,
            child: ShadowContainer(
              //headerText: 'Browser Defaults',
              headerText: lang.document,
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: lg+8,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                          formGroup: documentMasterForm,
                          child: Column(
                                                       
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'nameAr',
                                decoration: InputDecoration(
                                  labelText: lang.nameAr,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  // Last Name
                  
                  
                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: lg+8,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ReactiveForm(
                          formGroup: documentMasterForm,
                          child: Column(
                            children: [
                              ReactiveTextField<String>(
                                formControlName: 'nameEn',
                                decoration: InputDecoration(
                                  labelText: lang.name,
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),

                  
                  
                  ResponsiveGridCol(
                    lg: lg+8,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 1),
                      child: ReactiveForm(
                          formGroup: documentMasterForm,
                          child: Row(
                            
                            children: [
                              ReactiveSwitch(
                                activeColor: FinanceAppColors.kInfo,
                                formControlName: 'hasExpiryDate',
                                
                              ),
                                  ReactiveValueListenableBuilder<bool>(
                formControlName: 'hasExpiryDate',
                builder: (context, value, child) {
                  return Text(
                    'Expiry Date - ${value.value == true ? "Yes" : "No"}',
                    style: TextStyle(fontSize: 14),
                  );
                },
              ),
              
                            ],
                          )),
                    ),
                  ),
                  
                  ResponsiveGridCol(
                    lg: lg+6,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 1),
                      child: ReactiveForm(
                          formGroup: documentMasterForm,
                          child: Row(
                            
                            children: [
                              ReactiveSwitch(
                                activeColor: FinanceAppColors.kInfo,
                                formControlName: 'isActive',
                                
                              ),
                                  ReactiveValueListenableBuilder<bool>(
                formControlName: 'isActive',
                builder: (context, value, child) {
                  return Text(
                    'Active - ${value.value == true ? "ON" : "OFF"}',
                    style: TextStyle(fontSize: 14),
                  );
                },
              ),
              ],
                          )),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: lg+4,
                    md: md,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 1),
                      child: ReactiveForm(
                          formGroup: documentMasterForm,
                          child: Row(                            
                            children: [
              ReactiveSwitch(
                activeColor: FinanceAppColors.kInfo,
                                formControlName: 'isMandatory',
                                
                              ),
                                  ReactiveValueListenableBuilder<bool>(
                formControlName: 'isMandatory',
                builder: (context, value, child) {
                  return Text(
                    'Mandatory - ${value.value == true ? "ON" : "OFF"}',
                    style: TextStyle(fontSize: 14),
                  );
                },
              ),
                            ],
                          )),
                    ),
                  ),
                  // Save Form Button

                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(FinanceAppColors.kError)),
                        icon: Icon(
                          Icons.cancel_presentation_rounded,
                          size: 17,
                          color: FinanceAppColors.kWhiteColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        //child: const Text('Save From'),
                        label: Text(lang.cancel),
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(sizeInfo.innerSpacing / 2),
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.save_alt_rounded,
                          size: 17,
                          color: FinanceAppColors.kWhiteColor,
                        ),
                        onPressed: () {
                          if (documentMasterForm.touched) {
                            // widget.tabController.animateTo(3);
                            print('Form Value: ${documentMasterForm.value}');
                          } else {
                            documentMasterForm.markAllAsTouched();
                          }
                        },
                        //child: const Text('Save From'),
                        label: Text(lang.modify),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: sizeInfo.innerSpacing),
        ],
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
