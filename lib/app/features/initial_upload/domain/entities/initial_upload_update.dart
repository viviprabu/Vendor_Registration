import 'package:equatable/equatable.dart';

class InitialUploadUpdate extends Equatable {
  final String? id;
  final String? name;

  const InitialUploadUpdate({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
