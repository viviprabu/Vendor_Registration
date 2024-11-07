import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final int? id;
  final int? sectorId;
  final String? name;

  const Department({
    required this.id,
    required this.sectorId,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        sectorId,
        name,
      ];
}
