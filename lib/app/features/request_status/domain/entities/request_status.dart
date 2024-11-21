import 'package:equatable/equatable.dart';

class RequestStatus extends Equatable {
  final int id;
  final String name;
  final String? description;
  final int sequence;
  bool status = true;

  RequestStatus({
    required this.id,
    required this.name,
    this.description,
    required this.sequence,
    required this.status,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description ?? '',
        sequence,
        status,
      ];
}
