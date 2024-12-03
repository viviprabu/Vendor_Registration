import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final int? id;
  final int? sectorId;
  final String? name;
  bool isSelected = false;

  Department({
    this.id,
    this.sectorId,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        sectorId,
        name,
      ];
}
