import 'package:equatable/equatable.dart';

class AssignedList extends Equatable {
  final String? id;
  final String? name;

  bool isSelected = false;

  AssignedList({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
