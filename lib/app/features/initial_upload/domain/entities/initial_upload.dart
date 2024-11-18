import 'package:equatable/equatable.dart';

class InitialUpload extends Equatable {
  final String? id;
  final String? name;

  bool isSelected = false;

  InitialUpload({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
