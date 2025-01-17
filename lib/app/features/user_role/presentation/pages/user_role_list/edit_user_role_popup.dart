// 🐦 Flutter imports:
import 'package:vendor_registration/app/common/widgets/toggle_switch_field/toggle_switcher.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/role_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/system_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/user_role.dart';
import 'package:vendor_registration/app/features/user_role/presentation/bloc/user_role_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

// 📦 Package imports:
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import '../../../../../../generated/l10n.dart' as l;
import '../../../../../core/theme/_app_colors.dart';

class EditUserRoleDialog extends StatefulWidget {
  final UserRole userData;
  const EditUserRoleDialog({
    required this.userData,
    super.key,
  });

  @override
  State<EditUserRoleDialog> createState() => _EditUserRoleDialogState();
}

class _EditUserRoleDialogState extends State<EditUserRoleDialog> {
  late final Logger logger;
  final TextEditingController _userRoleNameController = TextEditingController();
  final TextEditingController _userRoleDescriptionController =
      TextEditingController();

  List<RoleFunction> roleFunctions = [];
  List<RoleFunction> currentRoleFunctions = [];
  var uuid = Uuid();

  int toggleValue = 0;

  final userRoleCreationFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    final userRoleDetail = widget.userData;
    final userRoleId = userRoleDetail.id;
    context.read<UserRoleBloc>().add(UserRoleListEvent(userRoleId));
    context.read<UserRoleBloc>().add(SystemFunctionsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _userRoleNameController.dispose();
    _userRoleDescriptionController.dispose();
    roleFunctions.clear();
    currentRoleFunctions.clear();
    super.dispose();
  }

  void initializeRoleFunctions(List<SystemFunction> systemFunctions) {
    roleFunctions = systemFunctions.map((systemFunction) {
      return RoleFunction(
        id: uuid.v4().toString(),
        roleId: 0,
        name: null,
        systemFunctionId: systemFunction.id,
        systemFunctionName: systemFunction.name,
        accView: false,
        accAdd: false,
        accEdit: false,
        accDelete: false,
        accSpecial: false,
      );
    }).toList();

    bindCurrentRoleFunctions();
  }

  void bindCurrentRoleFunctions() {
    for (var currentRole in currentRoleFunctions) {
      for (var roleFunction in roleFunctions) {
        if (roleFunction.systemFunctionId == currentRole.systemFunctionId) {
          roleFunction.id = currentRole.id.toString();
          roleFunction.roleId = currentRole.roleId;
          roleFunction.accView = currentRole.accView;
          roleFunction.accAdd = currentRole.accAdd;
          roleFunction.accEdit = currentRole.accEdit;
          roleFunction.accDelete = currentRole.accDelete;
          roleFunction.accSpecial = currentRole.accSpecial;
        }
      }
    }
  }

  void togglePermission(int index, String type, bool? value) {
    setState(() {
      switch (type) {
        case 'view':
          roleFunctions[index].accView = value!;
          break;
        case 'add':
          roleFunctions[index].accAdd = value!;
          break;
        case 'edit':
          roleFunctions[index].accEdit = value!;
          break;
        case 'delete':
          roleFunctions[index].accDelete = value!;
          break;
        case 'special':
          roleFunctions[index].accSpecial = value!;
          break;
      }
    });
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
    return BlocListener<UserRoleBloc, UserRoleState>(
      listener: (listenerContext, listenerState) {
        if (listenerState is UserRoleError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(listenerState.message),
            ),
          );
        }

        if (listenerState is UserRoleUpdate) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('User Updated Successfully'),
            ),
          );
          // refresh the user list
          listenerContext.read<UserRoleBloc>().add(UserRolesListEvent());
          // close the dialog
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        content: BlocBuilder<UserRoleBloc, UserRoleState>(
          builder: (blocContext, blocState) {
            if (blocState is SystemFunctionList) {
              if (roleFunctions.isEmpty) {
                initializeRoleFunctions(blocState.systemFunctions);
              }
            }
            if (blocState is UserRoleList) {
              //loadCurrentRoleFunctions(blocState.userRoleFunctions);
              currentRoleFunctions = blocState.userRoleFunctions;
              bindCurrentRoleFunctions();
              _userRoleNameController.text = widget.userData.name;
              _userRoleDescriptionController.text =
                  widget.userData.description!;
              toggleValue = widget.userData.isActive! ? 0 : 1;
            }

            return SingleChildScrollView(
              child: Form(
                key: userRoleCreationFormKey,
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
                          Text(lang.add),
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
                              controller: _userRoleNameController,
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
                              controller: _userRoleDescriptionController,
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

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Table(
                                  columnWidths: const {
                                    0: FixedColumnWidth(
                                        150), // Adjust the width for the "Name" column as needed
                                  },
                                  border: TableBorder.all(color: Colors.grey),
                                  children: [
                                    // Header row
                                    TableRow(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Name',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'View',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Add',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Special',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Data rows

                                    ...roleFunctions
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      int index = entry.key;
                                      RoleFunction roleFunction = entry.value;
                                      return TableRow(
                                        children: [
                                          Text(
                                              roleFunction.systemFunctionName ??
                                                  ''),
                                          Checkbox(
                                            value: roleFunction.accView,
                                            onChanged: (value) {
                                              togglePermission(
                                                index,
                                                'view',
                                                value,
                                              );
                                              //print('view $index');
                                            },
                                          ),
                                          Checkbox(
                                              value: roleFunction.accAdd,
                                              onChanged: (value) {
                                                togglePermission(
                                                    index, 'add', value);
                                                //print('add $index');
                                              }),
                                          Checkbox(
                                            value: roleFunction.accEdit,
                                            onChanged: (value) {
                                              togglePermission(
                                                index,
                                                'edit',
                                                value,
                                              );
                                              //print('edit $index');
                                            },
                                          ),
                                          Checkbox(
                                              value: roleFunction.accDelete,
                                              onChanged: (value) {
                                                togglePermission(
                                                  index,
                                                  'delete',
                                                  value,
                                                );
                                                // print('delete $index');
                                              }),
                                          Checkbox(
                                              value: roleFunction.accSpecial,
                                              onChanged: (value) {
                                                togglePermission(
                                                  index,
                                                  'special',
                                                  value,
                                                );
                                                // print('special $index');
                                              }),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ],
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
                                      if (userRoleCreationFormKey.currentState!
                                          .validate()) {
                                        blocContext.read<UserRoleBloc>().add(
                                              UserRoleUpdateEvent(
                                                UserRole(
                                                  id: widget.userData.id,
                                                  name: _userRoleNameController
                                                      .text,
                                                  description:
                                                      _userRoleDescriptionController
                                                          .text,
                                                  isActive: () {
                                                    if (toggleValue == 0) {
                                                      return true;
                                                    } else {
                                                      return false;
                                                    }
                                                  }(),
                                                  roleSystemFunctions:
                                                      roleFunctions,
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
