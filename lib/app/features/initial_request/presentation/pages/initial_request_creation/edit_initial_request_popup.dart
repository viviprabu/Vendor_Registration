// 🐦 Flutter imports:
import 'package:file_picker/file_picker.dart';
import 'package:finance_app/app/common/widgets/toggle_switch_field/toggle_switcher.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_update.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_bloc.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_event.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_state.dart';
import 'package:finance_app/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class EditInitialRequestDialog extends StatefulWidget {
  final InitialRequest requestData;
  const EditInitialRequestDialog({
    required this.requestData,
    super.key,
    required InitialRequest initialRequestData,
  });

  @override
  State<EditInitialRequestDialog> createState() => _EditUserDialogState();
}

class _EditUserDialogState extends State<EditInitialRequestDialog> {
  late final Logger logger;
  final _requestNumberController = TextEditingController();
  final _requestDateController = TextEditingController();
  final _estimatedAmountController = TextEditingController();
  final _dateFromController = TextEditingController();
  final _dateToController = TextEditingController();
  final _cdRepContactController = TextEditingController();
  final _subjectController = TextEditingController();
  final _listOfCdController = TextEditingController();
  final _documentFeesController = TextEditingController();
  final _uploadController = TextEditingController();
  final _stateController = TextEditingController();
  final _nextStepController = TextEditingController();

  int? _selectedRole;
  int? _selectedLanguage;
  int? _selectedBusinessRole;
  final bool _isDarkMode = false;
  final bool _isSuspended = false;
  int toggleValue = 0;

  final initialRequestFormKey = GlobalKey<FormState>();

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
    final requestDetail = widget.requestData;
    final requestId = requestDetail.id ?? '';
    context.read<UserBloc>().add(UserListEvent(requestId.toString()));
    super.initState();
  }

  @override
  void dispose() {
    _requestNumberController.dispose();
    _requestDateController.dispose();
    _estimatedAmountController.dispose();
    _dateFromController.dispose();
    _dateToController.dispose();
    _cdRepContactController.dispose();
    _subjectController.dispose();
    _documentFeesController.dispose();
    _uploadController.dispose();
    _stateController.dispose();
    _nextStepController.dispose();
    super.dispose();
  }

  String? fileName;

  Future<void> RequestFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.first.name;
        _uploadController.text = fileName.toString(); // Get the file name
      });
      print(result.files);
    }
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

        if (listenerState is InitialRequestUpdateState) {
          if (listenerState.initialRequest.id != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Request Updated Successfully'),
              ),
            );
            // refresh the user list
            listenerContext.read<UserBloc>().add(UsersListEvent());
            // close the dialog
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Request Creation Failed'),
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
            if (blocState is InitialRequestListState) {
              final userDetails = blocState.initialRequest;
              _requestNumberController.text = userDetails.requestNumber ?? '';
              _requestDateController.text = userDetails.requestDate.toString();
              _estimatedAmountController.text =
                  userDetails.estimatedAmount ?? '';
              _dateFromController.text = userDetails.yearFrom ?? '';
              _dateToController.text = userDetails.yearTo ?? '';
              _dateToController.text = userDetails.yearTo ?? '';
              _cdRepContactController.text = userDetails.cdRepContact ?? '';
              _subjectController.text = userDetails.subject ?? '';
              _documentFeesController.text = userDetails.documentFees ?? '';
              _uploadController.text = userDetails.uploadDocument ?? '';
              _stateController.text = userDetails.state ?? '';
              _nextStepController.text = userDetails.nextStep ?? '';
            }
            return SingleChildScrollView(
              child: Form(
                key: initialRequestFormKey,
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
                            Text(lang.requestNumber,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: lang.requestNumber,
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
                              controller: _requestNumberController,
                            ),

                            const SizedBox(height: 20),

                            Text(lang.requestDate, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                //hintText: 'Enter Your Email',
                                hintText: lang.requestDate,
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
                              controller: _requestDateController,
                            ),

                            const SizedBox(height: 20),

                            Text(lang.estimatedAmount,
                                style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.estimatedAmount,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _estimatedAmountController,
                            ),
                            const SizedBox(height: 20),

                            Text(lang.yearFrom, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.yearFrom,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _dateFromController,
                            ),
                            const SizedBox(height: 20),

                            Text(lang.yearTo, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.yearTo,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _dateToController,
                            ),
                            Text(lang.cdRepContact, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.cdRepContact,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _cdRepContactController,
                            ),

                            Text(lang.subject, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.subject,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _subjectController,
                            ),
                            Text(lang.documentFees, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.documentFees,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _documentFeesController,
                            ),

                            Text(lang.fileUpload, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _uploadController,
                              decoration: InputDecoration(
                                //hintText: 'Document Name',
                                hintText: lang.pleaseUploadAnyFile,

                                suffixIcon: Container(
                                  margin: const EdgeInsetsDirectional.all(5),
                                  child: ElevatedButton.icon(
                                    icon: Icon(
                                      Icons.select_all_rounded,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      RequestFile();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding:
                                          const EdgeInsetsDirectional.symmetric(
                                        horizontal: 24,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      visualDensity:
                                          const VisualDensity(vertical: -4),
                                    ),
                                    // child: const Text('Save'),
                                    label: Text(lang.select),
                                  ),
                                ),
                              ),
                            ),
                            Text(lang.state, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.state,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _stateController,
                            ),
                            Text(lang.next, style: textTheme.bodySmall),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                // hintText: 'Enter Your Phone Number',
                                hintText: lang.next,
                                hintStyle: textTheme.bodySmall,
                              ),
                              keyboardType: TextInputType.phone,
                              controller: _nextStepController,
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

                            // const SizedBox(height: 20),
                            // Text(lang.description, style: textTheme.bodySmall),
                            // const SizedBox(height: 8),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     //hintText: 'Write Something',
                            //     hintText: lang.description,
                            //     hintStyle: textTheme.bodySmall,
                            //   ),
                            //   maxLines: 3,
                            //   controller: _u,
                            // ),
                            // const SizedBox(height: 20),
                            // Text(lang.suspendReason,
                            //     style: textTheme.bodySmall),
                            // const SizedBox(height: 8),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     //hintText: 'Write Something',
                            //     hintText: lang.suspendReason,
                            //     hintStyle: textTheme.bodySmall,
                            //   ),
                            //   maxLines: 3,
                            //   controller: _userSuspendendReasonController,
                            // ),
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
                                      /* if (initialRequestFormKey.currentState!
                                          .validate()) {
                                        blocContext
                                            .read<InitialRequestBloc>()
                                            .add(
                                              InitialRequestUpdateEvent(
                                                InitialRequestUpdate(
                                                  id: widget.requestData.id,
                                                  requestNumber:
                                                      _requestNumberController
                                                          .text,
                                                  requestDate:
                                                      DateTime.tryParse(
                                                          _requestDateController
                                                              .text),
                                                  estimatedAmount:
                                                      _estimatedAmountController
                                                          .text,
                                                  yearFrom:
                                                      _dateFromController.text,
                                                  yearTo:
                                                      _dateToController.text,
                                                  cdRepContact:
                                                      _cdRepContactController
                                                          .text,
                                                  subject:
                                                      _subjectController.text,
                                                  documentFees:
                                                      _documentFeesController
                                                          .text,
                                                  uploadDocument:
                                                      _uploadController.text,
                                                  state: _stateController.text,
                                                  nextStep:
                                                      _nextStepController.text,
                                                  /* sectorId: 1,
                                                  deptId: 1, */
                                                ),
                                              ),
                                            );
                                      } */
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
