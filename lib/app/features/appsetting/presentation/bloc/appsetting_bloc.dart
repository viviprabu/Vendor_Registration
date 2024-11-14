import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/usecases/create_appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/usecases/delete_appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/usecases/get_appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/usecases/get_appsettings.dart';
import 'package:finance_app/app/features/appsetting/domain/usecases/update_appsetting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'appsetting_event.dart';
part 'appsetting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  GetAppSetting getAppSetting;
  CreateAppSetting createAppSetting;
  DeleteAppSetting deleteAppSetting;
  GetAppSettings getAppSettings;
  UpdateAppSetting updateAppSetting;

  AppSettingBloc({
    required this.getAppSetting,
    required this.createAppSetting,
    required this.deleteAppSetting,
    required this.getAppSettings,
    required this.updateAppSetting,
  }) : super(AppSettingInitialState()) {
    on<AppSettingListEvent>((event, emit) async {
      emit(AppSettingLoadingState());
      final failureOrAppSetting = await getAppSetting(event.id);
      failureOrAppSetting.fold(
        (failure) => emit(AppSettingError(failure.toString())),
        (appSetting) => emit(AppSettingListState(appSetting)),
      );
    });

    on<AppSettingsListEvent>((event, emit) async {
      emit(AppSettingLoadingState());
      final failureOrAppSettings = await getAppSettings();
      failureOrAppSettings.fold(
        (failure) => emit(AppSettingError(failure.toString())),
        (appSettings) => emit(AppSettingsListState(appSettings)),
      );
    });

    on<AppSettingCreateEvent>((event, emit) async {
      emit(AppSettingLoadingState());
      final failureOrAppSetting = await createAppSetting(event.appSetting);
      failureOrAppSetting.fold(
        (failure) => emit(AppSettingError(failure.toString())),
        (appSetting) => emit(AppSettingCreateState(appSetting)),
      );
    });

    on<AppSettingUpdateEvent>((event, emit) async {
      emit(AppSettingLoadingState());
      final failureOrAppSetting = await updateAppSetting(event.appSetting);
      failureOrAppSetting.fold(
        (failure) => emit(AppSettingError(failure.toString())),
        (appSetting) => emit(AppSettingUpdateState(appSetting)),
      );
    });

    on<AppSettingDeleteEvent>((event, emit) async {
      emit(AppSettingLoadingState());
      final failureOrAppSetting = await deleteAppSetting(event.appSetting);
      failureOrAppSetting.fold(
        (failure) => emit(AppSettingError(failure.toString())),
        (appSetting) => emit(AppSettingDeleteState(appSetting)),
      );
    });

    on<AppSettingInitialEvent>((event, emit) {
      emit(AppSettingInitialState());
    });
  }
}
