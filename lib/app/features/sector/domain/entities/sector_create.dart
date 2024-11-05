import 'package:equatable/equatable.dart';

class SectorCreate extends Equatable {
  final String? name;

  const SectorCreate({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
