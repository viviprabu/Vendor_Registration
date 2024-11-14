import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/Setting/domain/entities/Setting_create.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting_update.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class SettingInitialEvent extends SettingEvent {}

class SettingsListEvent extends SettingEvent {}

class SettingCreateEvent extends SettingEvent {
  final SettingCreate settingCreate;
  const SettingCreateEvent(this.settingCreate);

  @override
  List<Object> get props => [settingCreate];
}

class SettingUpdateEvent extends SettingEvent {
  final SettingUpdate settingUpdate;
  const SettingUpdateEvent(this.settingUpdate);

  @override
  List<Object> get props => [settingUpdate];
}

class SettingDeleteEvent extends SettingEvent {
  final Setting setting;
  const SettingDeleteEvent(this.setting);

  @override
  List<Object> get props => [setting];
}

class SettingListEvent extends SettingEvent {
  final String id;
  const SettingListEvent(this.id);

  @override
  List<Object> get props => [id];
}
