import 'package:finance_app/app/features/services/domain/entities/appsetting_create.dart';

class AppSettingCreateModal {
  final String? name;

  const AppSettingCreateModal({
    required this.name,
  });

  factory AppSettingCreateModal.fromJson(Map<String, dynamic> json) {
    return AppSettingCreateModal(
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

  factory AppSettingCreateModal.fromEntity(AppSettingCreate appSettingCreate) {
    return AppSettingCreateModal(
      name: appSettingCreate.name,
    );
  }

  AppSettingCreate toEntity() {
    return AppSettingCreate(
      name: name,
    );
  }
}
