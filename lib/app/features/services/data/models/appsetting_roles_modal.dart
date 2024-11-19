import 'package:finance_app/app/features/services/domain/entities/appsetting_roles.dart';

class AppSettingRolesModal {
  final int? id;
  final String? name;
  final bool? isActive;
  final bool? isEditable;
  final String? description;

  AppSettingRolesModal(
      {required this.id,
      required this.name,
      required this.isActive,
      required this.isEditable,
      required this.description});

  factory AppSettingRolesModal.fromJson(Map<String, dynamic> json) {
    return AppSettingRolesModal(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      isActive: json["isActive"] ?? "",
      isEditable: json["isEditable"] ?? "",
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
        "isActive": isActive,
        "isEditable": isEditable,
        "description": description
      };

  factory AppSettingRolesModal.fromEntity(AppSettingRoles appSetting) {
    return AppSettingRolesModal(
        id: appSetting.id,
        name: appSetting.name,
        isActive: appSetting.isActive,
        isEditable: appSetting.isEditable,
        description: appSetting.description);
  }

  AppSettingRoles toEntity() {
    return AppSettingRoles(
        id: id,
        name: name,
        isActive: isActive,
        isEditable: isEditable,
        description: description);
  }
}
