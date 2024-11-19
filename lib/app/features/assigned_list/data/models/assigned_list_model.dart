import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';

class AssignedListModal extends AssignedList {
  AssignedListModal({
    required super.id,
    required super.name,
  });

  factory AssignedListModal.fromJson(Map<String, dynamic> json) {
    return AssignedListModal(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  factory AssignedListModal.fromEntity(AssignedList assignedList) {
    return AssignedListModal(id: assignedList.id, name: assignedList.name);
  }

  AssignedList toEntity() {
    return AssignedList(id: id, name: name);
  }
}
