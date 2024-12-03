import 'package:vendor_registration/app/features/auth/domain/entities/user_rights.dart';

class UserRightsModel extends UserRights {
  const UserRightsModel({
    required super.applicationSettingId,
    required super.applicationSettingName,
    required super.roleId,
    required super.roleName,
  });

  factory UserRightsModel.fromJson(Map<String, dynamic> json) {
    return UserRightsModel(
      applicationSettingId: json["applicationSettingId"],
      applicationSettingName: json["applicationSettingName"],
      roleId: json["roleId"],
      roleName: json["roleName"],
    );
  }

  Map<String, dynamic> toJson() => {
        "applicationSettingId": applicationSettingId,
        "applicationSettingName": applicationSettingName,
        "roleId": roleId,
        "roleName": roleName,
      };

  UserRights toEntity() {
    return UserRights(
      applicationSettingId: applicationSettingId,
      applicationSettingName: applicationSettingName,
      roleId: roleId,
      roleName: roleName,
    );
  }

  // from entity
  factory UserRightsModel.fromEntity(UserRights entity) {
    return UserRightsModel(
      applicationSettingId: entity.applicationSettingId,
      applicationSettingName: entity.applicationSettingName,
      roleId: entity.roleId,
      roleName: entity.roleName,
    );
  }
}
