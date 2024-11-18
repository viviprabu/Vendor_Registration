import 'package:equatable/equatable.dart';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_roles_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_sysfunction_modal.dart';

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
      this.isSelected = false});

  @override
  List<Object?> get props => [id, name, roles, sysFunction, isSelected];

  get imagePath => AppConfig.appsImage;
}
