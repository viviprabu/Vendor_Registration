import 'package:equatable/equatable.dart';

class SettingCreate extends Equatable {
  final String? name;

  const SettingCreate({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
