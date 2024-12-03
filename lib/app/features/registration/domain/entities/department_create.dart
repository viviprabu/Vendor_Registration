import 'package:equatable/equatable.dart';

class DepartmentCreate extends Equatable {
  final String? sectorId;
  final String? name;

  const DepartmentCreate({
    required this.sectorId,
    required this.name,
  });

  @override
  List<Object?> get props => [
        sectorId,
        name,
      ];
}
