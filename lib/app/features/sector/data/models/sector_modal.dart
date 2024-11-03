import 'package:finance_app/app/features/sector/domain/entities/sector.dart';

class SectorModal {
  final String? id;
  final String? name;

  SectorModal({
    required this.id,
    required this.name,
  });

  factory SectorModal.fromJson(Map<String, dynamic> json) {
    return SectorModal(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory SectorModal.fromEntity(Sector sector) {
    return SectorModal(
      id: sector.id,
      name: sector.name,
    );
  }

  Sector toEntity() {
    return Sector(
      id: id,
      name: name,
    );
  }
}
