import 'package:finance_app/app/features/Setting/domain/entities/Setting_update.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/create_Setting.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/delete_Setting.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/get_Setting.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/get_Settings.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/update_Setting.dart';
import 'package:finance_app/app/features/setting/presentation/bloc/setting_event.dart';
import 'package:finance_app/app/features/setting/presentation/bloc/setting_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  GetSetting getSetting;
  GetSettings getSettings;
  CreateSetting createSetting;
  UpdateSetting updateSetting;
  DeleteSetting deleteSetting;

  SettingBloc({
    required this.getSetting,
    required this.getSettings,
    required this.createSetting,
    required this.updateSetting,
    required this.deleteSetting,
  }) : super(SettingInitial()) {
    on<SettingListEvent>((event, emit) async {
      emit(SettingLoadingState());
      final failureOrSetting = await getSetting(event.id);
      failureOrSetting.fold(
        (failure) => emit(SettingError(failure.toString())),
        (setting) => emit(SettingListState(setting)),
      );
    });

    on<SettingsListEvent>((event, emit) async {
      emit(SettingLoadingState());
      final failureOrSettings = await getSettings();
      failureOrSettings.fold(
        (failure) => emit(SettingError(failure.toString())),
        (settings) => emit(SettingsListState(settings)),
      );
    });

    on<SettingCreateEvent>((event, emit) async {
      emit(SettingLoadingState());
      final failureOrSetting = await createSetting(event.settingCreate);
      failureOrSetting.fold(
        (failure) => emit(SettingError(failure.toString())),
        (setting) => emit(SettingCreateState(setting)),
      );
    });

    on<SettingUpdateEvent>((event, emit) async {
      emit(SettingLoadingState());
      final failureOrSetting =
          await updateSetting(event.settingUpdate as SettingUpdate);
      failureOrSetting.fold(
        (failure) => emit(SettingError(failure.toString())),
        (setting) => emit(SettingUpdateState(setting)),
      );
    });

    on<SettingDeleteEvent>((event, emit) async {
      emit(SettingLoadingState());
      final failureOrSetting = await deleteSetting(event.setting);
      failureOrSetting.fold(
        (failure) => emit(SettingError(failure.toString())),
        (setting) => emit(SettingDeleteState(setting)),
      );
    });

    on<SettingInitialEvent>((event, emit) {
      emit(SettingInitial());
    });
  }
}
