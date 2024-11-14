import 'package:finance_app/app/features/services/domain/entities/appsetting_sysfunction.dart';

class AppSettingSysFunctionModal {
  final int? id;
  final String? name;
  final String? description;

  AppSettingSysFunctionModal(
      {required this.id, required this.name, required this.description});

  factory AppSettingSysFunctionModal.fromJson(Map<String, dynamic> json) {
    return AppSettingSysFunctionModal(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() =>
      {"id": id ?? 0, "name": name, "description": description};

  factory AppSettingSysFunctionModal.fromEntity(
      AppSettingSysFunction appSetting) {
    return AppSettingSysFunctionModal(
        id: appSetting.id,
        name: appSetting.name,
        description: appSetting.description);
  }

  AppSettingSysFunction toEntity() {
    return AppSettingSysFunction(id: id, name: name, description: description);
  }
}
