import 'package:equatable/equatable.dart';

class AppSetting extends Equatable {
  final int? id;
  final String? name;
  final List<String>? roles;
  bool isSelected = false;

  AppSetting({
    this.id,
    this.name,
    this.roles,
  });

  @override
  List<Object?> get props => [id, name, roles];
}
