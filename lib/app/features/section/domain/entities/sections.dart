import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final int? id;
  final int? departmentId;
  final String? name;
  bool isSelected = false;

  Section({
    this.id,
    this.departmentId,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        departmentId,
        name,
      ];
}
