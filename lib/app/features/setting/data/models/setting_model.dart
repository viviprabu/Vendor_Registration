import 'package:finance_app/app/features/setting/domain/entities/setting.dart';

class SettingModal extends Setting {
  SettingModal({
    required super.id,
    required super.name,
  });

  factory SettingModal.fromJson(Map<String, dynamic> json) {
    return SettingModal(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory SettingModal.fromEntity(Setting setting) {
    return SettingModal(id: setting.id, name: setting.name);
  }

  Setting toEntity() {
    return Setting(id: id, name: name);
  }
}
