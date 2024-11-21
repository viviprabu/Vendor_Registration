import 'package:finance_app/app/features/request_status/domain/entities/request_status.dart';

class RequestStatusModel extends RequestStatus {
  RequestStatusModel({
    required super.id,
    required super.name,
    super.description,
    required super.sequence,
    required super.status,
  });

  factory RequestStatusModel.fromJson(Map<String, dynamic> json) {
    return RequestStatusModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      sequence: json['sequence'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sequence': sequence,
      'status': status,
    };
  }

  factory RequestStatusModel.fromEntity(RequestStatus requestStatus) {
    return RequestStatusModel(
      id: requestStatus.id,
      name: requestStatus.name,
      description: requestStatus.description,
      sequence: requestStatus.sequence,
      status: requestStatus.status,
    );
  }

  RequestStatus toEntity() {
    return RequestStatus(
      id: id,
      name: name,
      description: description,
      sequence: sequence,
      status: status,
    );
  }
}
