import 'package:equatable/equatable.dart';

class AssignedListCreate extends Equatable {
  final String? name;

  const AssignedListCreate({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
