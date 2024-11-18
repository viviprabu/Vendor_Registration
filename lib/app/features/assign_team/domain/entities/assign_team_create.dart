import 'package:equatable/equatable.dart';

class InitialUploadCreate extends Equatable {
  final String? name;

  const InitialUploadCreate({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
