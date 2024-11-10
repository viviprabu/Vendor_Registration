import 'package:equatable/equatable.dart';

class AppSettingCreate extends Equatable {
  final String? name;

  const AppSettingCreate({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
