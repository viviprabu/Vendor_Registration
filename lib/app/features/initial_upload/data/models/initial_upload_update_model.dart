import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_update.dart';

class InitialUploadUpdateModal extends InitialUploadUpdate {
  const InitialUploadUpdateModal({
    required super.id,
    required super.name,
  });

  factory InitialUploadUpdateModal.fromJson(Map<String, dynamic> json) {
    return InitialUploadUpdateModal(
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
  factory InitialUploadUpdateModal.fromEntity(
      InitialUploadUpdate initialUploadUpdate) {
    return InitialUploadUpdateModal(
      id: initialUploadUpdate.id,
      name: initialUploadUpdate.name,
    );
  }

  // toEntity
  InitialUploadUpdate toEntity() {
    return InitialUploadUpdate(
      id: id,
      name: name,
    );
  }
}
