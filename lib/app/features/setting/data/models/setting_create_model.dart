import 'package:finance_app/app/features/Setting/domain/entities/Setting_create.dart';

class SettingCreateModal extends SettingCreate {
  const SettingCreateModal({
    required super.name,
  });

  factory SettingCreateModal.fromJson(Map<String, dynamic> json) {
    return SettingCreateModal(
      name: json["name"] ?? "",
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      "name": name,
    };
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  factory SettingCreateModal.fromEntity(SettingCreate settingCreate) {
    return SettingCreateModal(name: settingCreate.name);
  }

  SettingCreate toEntity() {
    return SettingCreate(
      name: name,
    );
  }
}
