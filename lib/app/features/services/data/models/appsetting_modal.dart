import 'package:finance_app/app/features/services/data/models/appsetting_roles_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_sysfunction_modal.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';

class AppSettingModal {
  final int? id;
  final String? name;
  List<AppSettingRolesModal> roles = [];
  List<AppSettingSysFunctionModal> sysFunction = [];

  AppSettingModal(
      {required this.id,
      required this.name,
      required this.roles,
      required this.sysFunction});

  factory AppSettingModal.fromJson(Map<String, dynamic> json) {
    return AppSettingModal(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      roles: (json["roles"] as List<dynamic>? ?? [])
          .map((item) => AppSettingRolesModal.fromJson(item))
          .toList(),
      sysFunction: (json["sysFunction"] as List<dynamic>? ?? [])
          .map((item) => AppSettingSysFunctionModal.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
        "roles": roles.map((role) => role.toJson()).toList(),
        "sysFunction": sysFunction.map((func) => func.toJson()).toList(),
      };

  factory AppSettingModal.fromEntity(AppSetting appSetting) {
    return AppSettingModal(
        id: appSetting.id,
        name: appSetting.name,
        roles: appSetting.roles!.toList(),
        sysFunction: appSetting.sysFunction!.toList());
  }

  AppSetting toEntity() {
    return AppSetting(
        id: id,
        name: name,
        roles: roles,
        sysFunction: sysFunction,
        isSelected: false);
  }
}
