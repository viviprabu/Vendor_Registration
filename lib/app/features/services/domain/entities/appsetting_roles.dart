import 'package:equatable/equatable.dart';

class AppSettingRoles extends Equatable {
  final int? id;
  final String? name;
  final bool? isActive;
  final bool? isEditable;
  final String? description;

  const AppSettingRoles(
      {this.id, this.name, this.isActive, this.isEditable, this.description});

  @override
  List<Object?> get props => [id, name, isActive, isEditable, description];
}
