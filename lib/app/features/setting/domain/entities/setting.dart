import 'package:equatable/equatable.dart';

class Setting extends Equatable {
  final String? id;
  final String? name;

  bool isSelected = false;

  Setting({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
