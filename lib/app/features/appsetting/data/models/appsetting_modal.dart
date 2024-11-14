import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';

class AppSettingModal {
  final int? id;
  final String? name;
  final List<String> roles;

  AppSettingModal({
    required this.id,
    required this.name,
    required this.roles,
  });

  factory AppSettingModal.fromJson(Map<String, dynamic> json) {
    return AppSettingModal(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      roles: json["roles"] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "name": name,
        "roles": roles,
      };

  factory AppSettingModal.fromEntity(AppSetting appSetting) {
    return AppSettingModal(
        id: appSetting.id,
        name: appSetting.name,
        roles: appSetting.roles as List<String>);
  }

  AppSetting toEntity() {
    return AppSetting(id: id, name: name, roles: roles);
  }
}
