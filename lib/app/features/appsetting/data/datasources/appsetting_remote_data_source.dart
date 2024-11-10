import 'package:finance_app/app/features/appsetting/data/models/appsetting_modal.dart';
import 'package:finance_app/app/features/sector/data/models/sector_modal.dart';

abstract interface class AppSettingRemoteDataSource {
  Future<AppSettingModal> getAppSetting(int id);
  Future<AppSettingModal> updateAppSetting(AppSettingModal appSettingModel);
  Future<AppSettingModal> deleteAppSetting(AppSettingModal appSettingModel);
  Future<AppSettingModal> createAppSetting(AppSettingModal appSettingModel);
  Future<List<AppSettingModal>> getAppSettings();
}
