import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload.dart';

class InitialUploadModal extends InitialUpload {
  InitialUploadModal({
    required super.id,
    required super.name,
  });

  factory InitialUploadModal.fromJson(Map<String, dynamic> json) {
    return InitialUploadModal(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory InitialUploadModal.fromEntity(InitialUpload initialUpload) {
    return InitialUploadModal(id: initialUpload.id, name: initialUpload.name);
  }

  InitialUpload toEntity() {
    return InitialUpload(id: id, name: name);
  }
}
