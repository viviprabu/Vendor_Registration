import 'package:finance_app/app/features/appsetting/data/models/appsetting_roles_modal.dart';
import 'package:finance_app/app/features/appsetting/data/models/appsetting_sysfunction_modal.dart';
import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';

class AppSettingModal {
  final int? id;
  final String? name;
  final List<AppSettingRolesModal> roles;
  final List<AppSettingSysFunctionModal> sysFunction;

  AppSettingModal(
      {required this.id,
      required this.name,
      required this.roles,
      required this.sysFunction});

  factory AppSettingModal.fromJson(Map<String, dynamic> json) {
    return AppSettingModal(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      roles: json["roles"] ?? [],
      sysFunction: json["sysFunction"] ?? [],
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id ?? 0, "name": name, "roles": roles, "sysFunction": sysFunction};

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
