import 'package:vendor_registration/app/features/user_role/data/models/role_function_model.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/user_role.dart';

class UserRoleModel {
  final int id;
  final String name;
  final bool? isActive;
  final bool? isEditable;
  final String? description;
  final List<RoleFunctionModel>? roleSystemFunctions;

  UserRoleModel({
    required this.id,
    required this.name,
    this.isActive = true,
    this.isEditable = true,
    this.description = "",
    this.roleSystemFunctions,
  });

  factory UserRoleModel.fromJson(Map<String, dynamic> json) {
    return UserRoleModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      isActive: json["isActive"] ?? true,
      isEditable: json["isEditable"] ?? true,
      description: json["description"] ?? "",
      roleSystemFunctions: json['roleSystemFunctions'] != null
          ? (json['roleSystemFunctions'] as List<dynamic>)
              .map((item) => RoleFunctionModel.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "isEditable": isEditable,
        "description": description,
        'roleSystemFunctions':
            roleSystemFunctions?.map((item) => item.toJson()).toList(),
      };

  factory UserRoleModel.fromEntity(UserRole userRole) {
    return UserRoleModel(
      id: userRole.id,
      name: userRole.name,
      isActive: userRole.isActive,
      isEditable: userRole.isEditable,
      description: userRole.description,
      roleSystemFunctions: userRole.roleSystemFunctions
          ?.map((roleFunc) => RoleFunctionModel.fromEntity(roleFunc))
          .toList(),
    );
  }

  UserRole toEntity() {
    return UserRole(
      id: id,
      name: name,
      isActive: isActive,
      isEditable: isEditable,
      description: description,
      roleSystemFunctions: roleSystemFunctions,
    );
  }
}
