part of 'appsetting_bloc.dart';

abstract class AppSettingState extends Equatable {
  const AppSettingState();

  @override
  List<Object> get props => [];
}

class AppSettingInitialState extends AppSettingState {}

class AppSettingLoadingState extends AppSettingState {}

class AppSettingCreateState extends AppSettingState {
  final AppSetting appSetting;
  const AppSettingCreateState(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingsListState extends AppSettingState {
  final List<AppSetting> appSettings;
  const AppSettingsListState(this.appSettings);

  @override
  List<Object> get props => [appSettings];
}

class AppSettingUpdateState extends AppSettingState {
  final AppSetting appSetting;
  const AppSettingUpdateState(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingDeleteState extends AppSettingState {
  final AppSetting appSetting;
  const AppSettingDeleteState(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingListState extends AppSettingState {
  final AppSetting appSetting;
  const AppSettingListState(this.appSetting);

  @override
  List<Object> get props => [AppSetting];
}

class AppSettingError extends AppSettingState {
  final String message;
  const AppSettingError(this.message);

  @override
  List<Object> get props => [message];
}
