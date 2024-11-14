import 'package:finance_app/app/features/user_role/domain/entities/role_function.dart';

class RoleFunctionModel extends RoleFunction {
  RoleFunctionModel({
    required super.id,
    required super.roleId,
    super.roleName,
    required super.systemFunctionId,
    super.systemFunctionName,
    super.accView = true,
    super.accAdd = false,
    super.accEdit = false,
    super.accDelete = false,
    super.accSpecial = false,
  });

  factory RoleFunctionModel.fromJson(Map<String, dynamic> json) {
    return RoleFunctionModel(
      id: json['id'],
      roleId: json['roleId'],
      roleName: json['roleName'],
      systemFunctionId: json['systemFunctionId'],
      systemFunctionName: json['systemFunctionName'],
      accView: json['accView'],
      accAdd: json['accAdd'],
      accEdit: json['accEdit'],
      accDelete: json['accDelete'],
      accSpecial: json['accSpecial'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'roleId': roleId,
        'roleName': roleName,
        'systemFunctionId': systemFunctionId,
        'systemFunctionName': systemFunctionName,
        'accView': accView,
        'accAdd': accAdd,
        'accEdit': accEdit,
        'accDelete': accDelete,
        'accSpecial': accSpecial,
      };

  factory RoleFunctionModel.fromEntity(RoleFunction roleFunction) {
    return RoleFunctionModel(
      id: roleFunction.id,
      roleId: roleFunction.roleId,
      roleName: roleFunction.roleName,
      systemFunctionId: roleFunction.systemFunctionId,
      systemFunctionName: roleFunction.systemFunctionName,
      accView: roleFunction.accView,
      accAdd: roleFunction.accAdd,
      accEdit: roleFunction.accEdit,
      accDelete: roleFunction.accDelete,
      accSpecial: roleFunction.accSpecial,
    );
  }

  RoleFunction toEntity() {
    return RoleFunction(
      id: id,
      roleId: roleId,
      roleName: roleName,
      systemFunctionId: systemFunctionId,
      systemFunctionName: systemFunctionName,
      accView: accView,
      accAdd: accAdd,
      accEdit: accEdit,
      accDelete: accDelete,
      accSpecial: accSpecial,
    );
  }
}
