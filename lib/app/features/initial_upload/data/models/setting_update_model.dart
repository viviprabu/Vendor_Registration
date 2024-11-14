import 'package:finance_app/app/features/Setting/domain/entities/Setting_update.dart';

class SettingUpdateModal extends SettingUpdate {
  const SettingUpdateModal({
    required super.id,
    required super.name,
  });

  factory SettingUpdateModal.fromJson(Map<String, dynamic> json) {
    return SettingUpdateModal(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  // have to send as a form data

  Map<String, dynamic> toFormData() {
    return {
      "id": id,
      "name": name,
    };
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  // fromEninty
  factory SettingUpdateModal.fromEntity(SettingUpdate settingUpdate) {
    return SettingUpdateModal(
      id: settingUpdate.id,
      name: settingUpdate.name,
    );
  }

  // toEntity
  SettingUpdate toEntity() {
    return SettingUpdate(
      id: id,
      name: name,
    );
  }
}
