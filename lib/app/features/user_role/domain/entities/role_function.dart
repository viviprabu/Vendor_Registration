import 'package:equatable/equatable.dart';

class RoleFunction extends Equatable {
  final String id;
  final int? roleId;
  final String? roleName;
  final int? systemFunctionId;
  final String? systemFunctionName;
  bool? accView;
  bool? accAdd;
  bool? accEdit;
  bool? accDelete;
  bool? accSpecial;

  RoleFunction({
    required this.id,
    required this.roleId,
    required this.systemFunctionId,
    this.roleName,
    this.systemFunctionName,
    this.accView = false,
    this.accAdd = false,
    this.accEdit = false,
    this.accDelete = false,
    this.accSpecial = false,
  });

  @override
  List<Object?> get props => [
        id,
        roleId,
        roleName,
        systemFunctionId,
        systemFunctionName,
        accView,
        accAdd,
        accEdit,
        accDelete,
        accSpecial,
      ];
}
