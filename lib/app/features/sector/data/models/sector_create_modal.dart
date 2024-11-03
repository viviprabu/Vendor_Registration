import 'package:finance_app/app/features/sector/domain/entities/sector_create.dart';

class SectorCreateModal {
  final String? name;

  const SectorCreateModal({
    required this.name,
  });

  factory SectorCreateModal.fromJson(Map<String, dynamic> json) {
    return SectorCreateModal(
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

  factory SectorCreateModal.fromEntity(SectorCreate sectorCreate) {
    return SectorCreateModal(
      name: sectorCreate.name,
    );
  }

  SectorCreate toEntity() {
    return SectorCreate(
      name: name,
    );
  }
}
