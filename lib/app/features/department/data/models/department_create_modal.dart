import 'package:finance_app/app/features/department/domain/entities/department_create.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector_create.dart';

class DepartmentCreateModal {
  final String? sectorId;
  final String? name;

  const DepartmentCreateModal({required this.name, required this.sectorId});

  factory DepartmentCreateModal.fromJson(Map<String, dynamic> json) {
    return DepartmentCreateModal(
      sectorId: json["secotrId"] ?? "",
      name: json["name"] ?? "",
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      "secotrId": sectorId,
      "name": name,
    };
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  factory DepartmentCreateModal.fromEntity(DepartmentCreate deptCreate) {
    return DepartmentCreateModal(
      sectorId: deptCreate.sectorId,
      name: deptCreate.name,
    );
  }

  DepartmentCreate toEntity() {
    return DepartmentCreate(
      sectorId: sectorId,
      name: name,
    );
  }
}
