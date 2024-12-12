// 🐦 Flutter imports:
import 'package:reactive_forms/reactive_forms.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:vendor_registration/app/features/document_master/presentation/bloc/document_master_bloc.dart';
import 'package:vendor_registration/app/widgets/shadow_container/_shadow_container.dart';

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class AddDocumentMasterDialog extends StatefulWidget {
  const AddDocumentMasterDialog({super.key});

  @override
  State<AddDocumentMasterDialog> createState() => _AddDocumentMasterDialogState();
}

class _AddDocumentMasterDialogState extends State<AddDocumentMasterDialog> {
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
  int toggleValue = 0;
  int isDarkMode = 1;

  final documentMasterCreationFormKey = GlobalKey<FormState>();

  List<Map<int, String>> get _language => [
        {1: 'English'},
        {2: 'Arabic'},
      ];

  List<Map<int, String>> get _businessRole => [
        {1: 'admin'},
        {2: 'DocumentMaster'},
      ];

  List<Map<int, String>> get _userRoles => [
        {1: 'admin'},
        {2: 'user'},
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

        if (listenerState is DocumentMasterCreateState) {
          if (listenerState.documentMaster.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Document Added Successfully'),
              ),
            );
            // refresh the DocumentMaster list
            listenerContext.read<DocumentMasterBloc>().add(DocumentMastersListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Document Addition Failed'),
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
                        label: Text(lang.save),
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

