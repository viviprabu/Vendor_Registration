import 'package:finance_app/app/features/department/domain/entities/department.dart';

class DepartmentModal {
  final String? id;
  final String? sectorId;
  final String? name;

  DepartmentModal({
    required this.id,
    required this.sectorId,
    required this.name,
  });

  factory DepartmentModal.fromJson(Map<String, dynamic> json) {
    return DepartmentModal(
      id: json["id"] ?? "",
      sectorId: json["sectorId"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "sectorId": sectorId,
        "name": name,
      };

  factory DepartmentModal.fromEntity(Department dept) {
    return DepartmentModal(
      id: dept.id,
      sectorId: dept.sectorId,
      name: dept.name,
    );
  }

  Department toEntity() {
    return Department(
      id: id,
      sectorId: sectorId,
      name: name,
    );
  }
}
