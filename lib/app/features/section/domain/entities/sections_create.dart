import 'package:equatable/equatable.dart';

class SectionCreate extends Equatable {
  final String? departmentId;
  final String? name;

  const SectionCreate({
    required this.departmentId,
    required this.name,
  });

  @override
  List<Object?> get props => [
        departmentId,
        name,
      ];
}
