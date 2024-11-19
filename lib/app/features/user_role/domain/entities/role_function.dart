import 'package:equatable/equatable.dart';

class RoleFunction extends Equatable {
  String id;
  int? roleId;
  final String? name;
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
    this.name,
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
        name,
        systemFunctionId,
        systemFunctionName,
        accView,
        accAdd,
        accEdit,
        accDelete,
        accSpecial,
      ];
}
