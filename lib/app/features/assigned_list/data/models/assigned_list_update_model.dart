import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_update.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_request_update.dart';

class AssignedListUpdateModal extends AssignedListUpdate {
  const AssignedListUpdateModal({
    required super.id,
    required super.name,
  });

  factory AssignedListUpdateModal.fromJson(Map<String, dynamic> json) {
    return AssignedListUpdateModal(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }

  // have to send as a form data

  Map<String, dynamic> toFormData() {
    return {
      "id": id,
      "name": name,
    };
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  // fromEninty
  factory AssignedListUpdateModal.fromEntity(
      AssignedListUpdate assignedListUpdate) {
    return AssignedListUpdateModal(
      id: assignedListUpdate.id,
      name: assignedListUpdate.name,
    );
  }

  // toEntity
  AssignedListUpdate toEntity() {
    return AssignedListUpdate(
      id: id,
      name: name,
    );
  }
}
