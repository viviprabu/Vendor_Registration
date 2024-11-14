import 'package:finance_app/app/features/user_role/data/models/role_function_model.dart';
import 'package:finance_app/app/features/user_role/domain/entities/user_role.dart';

class UserRoleModel extends UserRole {
  UserRoleModel({
    required super.id,
    required super.name,
    super.isActive,
    super.isEnable,
    super.description,
    super.roleFunction,
  });

  factory UserRoleModel.fromJson(Map<String, dynamic> json) {
    return UserRoleModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      isActive: json["isActive"] ?? true,
      isEnable: json["isEnable"] ?? true,
      description: json["description"] ?? "",
      roleFunction: json['roleFunction'] != null
          ? RoleFunctionModel.fromJson(
              json['roleFunction'],
            ) // Use SystemFunctionModel
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "isEnable": isEnable,
        "description": description,
        'roleFunction': (roleFunction as RoleFunctionModel?)?.toJson(),
      };

  factory UserRoleModel.fromEntity(UserRole userRole) {
    return UserRoleModel(
      id: userRole.id,
      name: userRole.name,
      isActive: userRole.isActive,
      isEnable: userRole.isEnable,
      description: userRole.description,
      roleFunction: userRole.roleFunction != null
          ? RoleFunctionModel.fromEntity(
              userRole.roleFunction!) // Use SystemFunctionModel
          : null,
    );
  }

  UserRole toEntity() {
    return UserRole(
      id: id,
      name: name,
      isActive: isActive,
      isEnable: isEnable,
      description: description,
      roleFunction: roleFunction,
    );
  }
}
