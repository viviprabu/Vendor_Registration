import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_create.dart';

class InitialUploadCreateModal extends InitialUploadCreate {
  const InitialUploadCreateModal({
    required super.name,
  });

  factory InitialUploadCreateModal.fromJson(Map<String, dynamic> json) {
    return InitialUploadCreateModal(
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

  factory InitialUploadCreateModal.fromEntity(
      InitialUploadCreate initialUploadCreate) {
    return InitialUploadCreateModal(name: initialUploadCreate.name);
  }

  InitialUploadCreate toEntity() {
    return InitialUploadCreate(
      name: name,
    );
  }
}
