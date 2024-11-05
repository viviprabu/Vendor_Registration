import 'package:finance_app/app/features/sector/domain/entities/sector.dart';

class SectorModal {
  final int? id;
  final String? name;

  SectorModal({
    required this.id,
    required this.name,
  });

  factory SectorModal.fromJson(Map<String, dynamic> json) {
    return SectorModal(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
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
