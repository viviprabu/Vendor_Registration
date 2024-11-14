import 'package:finance_app/app/features/services/domain/entities/appsetting_update.dart';

class AppSettingUpdateModal extends AppSettingUpdate {
  const AppSettingUpdateModal({
    required super.id,
    required super.name,
    super.isSelected = false,
  });

  factory AppSettingUpdateModal.fromJson(Map<String, dynamic> json) {
    return AppSettingUpdateModal(
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
  factory AppSettingUpdateModal.fromEntity(AppSettingUpdate appSettingUpdate) {
    return AppSettingUpdateModal(
      id: appSettingUpdate.id,
      name: appSettingUpdate.name,
    );
  }

  // toEntity
  AppSettingUpdate toEntity() {
    return AppSettingUpdate(
      id: id,
      name: name,
      isSelected: false,
    );
  }
}
