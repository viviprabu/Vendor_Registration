import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';

abstract class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

class SettingInitial extends SettingState {}

class SettingLoadingState extends SettingState {}

class SettingsListState extends SettingState {
  final List<Setting> settings;
  const SettingsListState(this.settings);

  @override
  List<Object> get props => [settings];
}

class SettingCreateState extends SettingState {
  final Setting setting;
  const SettingCreateState(this.setting);

  @override
  List<Object> get props => [setting];
}

class SettingUpdateState extends SettingState {
  final Setting setting;
  const SettingUpdateState(this.setting);

  @override
  List<Object> get props => [setting];
}

class SettingDeleteState extends SettingState {
  final Setting setting;
  const SettingDeleteState(this.setting);

  @override
  List<Object> get props => [setting];
}

class SettingListState extends SettingState {
  final Setting setting;
  const SettingListState(this.setting);

  @override
  List<Object> get props => [setting];
}

class SettingError extends SettingState {
  final String message;
  const SettingError(this.message);

  @override
  List<Object> get props => [message];
}
