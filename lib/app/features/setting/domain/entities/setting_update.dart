import 'package:equatable/equatable.dart';

class SettingUpdate extends Equatable {
  final String? id;
  final String? name;

  const SettingUpdate({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
