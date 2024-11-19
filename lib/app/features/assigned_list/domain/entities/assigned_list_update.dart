import 'package:equatable/equatable.dart';

class AssignedListUpdate extends Equatable {
  final String? id;
  final String? name;

  const AssignedListUpdate({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
