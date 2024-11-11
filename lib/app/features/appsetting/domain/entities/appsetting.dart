import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/appsetting/data/models/appsetting_roles_modal.dart';
import 'package:finance_app/app/features/appsetting/data/models/appsetting_sysfunction_modal.dart';

class AppSetting extends Equatable {
  final int? id;
  final String? name;
  final List<AppSettingRolesModal>? roles;
  final List<AppSettingSysFunctionModal>? sysFunction;
  bool isSelected = false;

  AppSetting(
      {this.id,
      this.name,
      this.roles,
      this.sysFunction,
      required this.isSelected});

  @override
  List<Object?> get props => [id, name, roles, sysFunction, isSelected];
}
