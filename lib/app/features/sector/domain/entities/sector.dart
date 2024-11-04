import 'package:equatable/equatable.dart';

class Sector extends Equatable {
  final int? id;
  final String? name;
  bool? isSelected = false;

  Sector({
    this.id,
    this.name,
    this.isSelected,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
