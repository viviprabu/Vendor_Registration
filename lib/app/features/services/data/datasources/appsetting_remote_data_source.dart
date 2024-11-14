import 'package:finance_app/app/features/services/data/models/appsetting_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_update_model.dart';

abstract interface class AppSettingRemoteDataSource {
  Future<AppSettingModal> getAppSetting(int id);
  Future<AppSettingModal> updateAppSetting(
      AppSettingUpdateModal appSettingUpdateModel);
  Future<AppSettingModal> deleteAppSetting(AppSettingModal appSettingModel);
  Future<AppSettingModal> createAppSetting(AppSettingModal appSettingModel);
  Future<List<AppSettingModal>> getAppSettings();
}
