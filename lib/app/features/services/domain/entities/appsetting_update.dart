import 'package:equatable/equatable.dart';

class AppSettingUpdate extends Equatable {
  final String? id;
  final String? name;

  const AppSettingUpdate({
    required this.id,
    required this.name,
    bool isSelected = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
