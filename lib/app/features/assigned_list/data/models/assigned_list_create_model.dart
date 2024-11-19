import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';

class AssignedListCreateModal extends AssignedListCreate {
  const AssignedListCreateModal({
    required super.name,
  });

  factory AssignedListCreateModal.fromJson(Map<String, dynamic> json) {
    return AssignedListCreateModal(
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

  factory AssignedListCreateModal.fromEntity(
      AssignedListCreate assignedListCreate) {
    return AssignedListCreateModal(name: assignedListCreate.name);
  }

  AssignedListCreate toEntity() {
    return AssignedListCreate(
      name: name,
    );
  }
}
