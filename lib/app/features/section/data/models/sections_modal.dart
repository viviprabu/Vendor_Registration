import 'package:finance_app/app/features/section/domain/entities/sections.dart';

class SectionModal {
  final int? id;
  final int? departmentId;
  final String? name;

  SectionModal({
    required this.id,
    required this.departmentId,
    required this.name,
  });

  factory SectionModal.fromJson(Map<String, dynamic> json) {
    return SectionModal(
      id: json["id"] ?? "",
      departmentId: json["departmentId"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "departmentId": departmentId,
        "name": name,
      };

  factory SectionModal.fromEntity(Section section) {
    return SectionModal(
      id: section.id,
      departmentId: section.departmentId,
      name: section.name,
    );
  }

  Section toEntity() {
    return Section(
      id: id,
      departmentId: departmentId,
      name: name,
    );
  }
}
