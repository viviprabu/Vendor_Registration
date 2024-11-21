// 🐦 Flutter imports:
import 'package:file_picker/file_picker.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_bloc.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_event.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class AddInitialRequestDialog extends StatefulWidget {
  const AddInitialRequestDialog({super.key});

  @override
  State<AddInitialRequestDialog> createState() =>
      _AddInitialRequestDialogState();
}

class _AddInitialRequestDialogState extends State<AddInitialRequestDialog> {
  late final Logger logger;
  final _RequestController = TextEditingController();

  int? _selectedRole;
  int? _selectedLanguage;
  int? _selectedBusinessRole;
  int toggleValue = 0;
  int isDarkMode = 1;

  final RequestCreationFormKey = GlobalKey<FormState>();

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

  String? savedFilePath;
  final String _fileName = '';

  // void RequestFile() async {
  //   final results = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     type: FileType.custom,
  //     allowedExtensions: ['xls', 'xlsx'],
  //   );

  //   if (results != null) {
  //     final path = results.files.single.path!;

  //     _fileName = results.files.single.name;
  //     var storage;
  //     storage.RequestFile(path, _fileName);
  //     setState(() {});
  //     // print(_fileName);
  //     _RequestController.text = path.toString();
  //   } else {
  //     // User canceled the picker
  //   }
  // }

  String? fileName;

  Future<void> RequestFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.first.name;
        _RequestController.text = fileName.toString(); // Get the file name
      });
      // print(result.files);
    }
  }

  // Future<void> pickAndSaveExcelFile() async {
  //   // Request storage permissions
  //   if (await Permission.storage.request().isGranted) {
  //     try {
  //       // Pick the file
  //       FilePickerResult? result = await FilePicker.platform.pickFiles(
  //         type: FileType.custom,
  //         allowedExtensions: ['xlsx', 'xls'],
  //       );

  //       if (result != null) {
  //         File file = File(result.files.single.path!);

  //         // Get the local directory
  //         Directory directory = await getApplicationDocumentsDirectory();

  //         // Save the file in the app's local directory
  //         String newPath = "${directory.path}/${result.files.single.name}";
  //         await file.copy(newPath);

  //         setState(() {
  //           savedFilePath = newPath;
  //         });

  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('File saved to $newPath')),
  //         );
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Error: $e')),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Permission denied')),
  //     );
  //   }
  // }

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
    return BlocListener<InitialRequestBloc, InitialRequestState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is InitialRequestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is InitialRequestCreateState) {
          if (listenerState.initialRequest.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('File Requested Successfully'),
              ),
            );
            // refresh the user list
            listenerContext
                .read<InitialRequestBloc>()
                .add(InitialRequestsListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('File Request Failed'),
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
        content: BlocBuilder<InitialRequestBloc, InitialRequestState>(
          builder: (blocContext, blocState) {
            return SingleChildScrollView(
              child: Form(
                key: RequestCreationFormKey,
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
                          Text(lang.addNewInitialRequest),
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
                            Text(lang.request, style: textTheme.bodySmall),
                            const SizedBox(height: 8),

                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: lang.pleaseUploadAnyFile,
                                        hintStyle: textTheme.bodySmall,
                                      ),
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          // return 'Please enter your first name';
                                          return lang.pleaseUploadAnyFile;
                                        }
                                        return null;
                                      },
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: _RequestController,
                                      // Display file name
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: sizeInfo.innerSpacing),
                                  child: Expanded(
                                    child: Container(
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                              RequestFile();
                                            },
                                            label: Text(
                                              lang.request,
                                            ))),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            ///---------------- Submit Button section
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: sizeInfo.innerSpacing),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: sizeInfo.innerSpacing),
                                  ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: sizeInfo.innerSpacing),
                                    ),
                                    onPressed: () {},
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
