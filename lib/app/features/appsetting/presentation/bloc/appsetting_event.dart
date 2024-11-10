part of 'appsetting_bloc.dart';

abstract class AppSettingEvent extends Equatable {
  const AppSettingEvent();

  @override
  List<Object> get props => [];
}

class AppSettingInitialEvent extends AppSettingEvent {}

class AppSettingsListEvent extends AppSettingEvent {}

class AppSettingCreateEvent extends AppSettingEvent {
  final AppSetting appSetting;
  const AppSettingCreateEvent(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingUpdateEvent extends AppSettingEvent {
  final AppSetting appSetting;
  const AppSettingUpdateEvent(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingDeleteEvent extends AppSettingEvent {
  final AppSetting appSetting;
  const AppSettingDeleteEvent(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingListEvent extends AppSettingEvent {
  final int id;
  const AppSettingListEvent(this.id);

  @override
  List<Object> get props => [id];
}
