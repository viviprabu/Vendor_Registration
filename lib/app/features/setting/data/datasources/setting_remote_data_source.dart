import 'package:finance_app/app/features/setting/data/models/setting_create_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_update_model.dart';

abstract interface class SettingRemoteDataSource {
  Future<SettingModal> getSetting(String id);
  Future<SettingModal> updateSetting(SettingUpdateModal settingUpdateModel);
  Future<SettingModal> deleteSetting(SettingModal settingModel);
  Future<SettingModal> createSetting(SettingCreateModal settingCreateModel);
  Future<List<SettingModal>> getSettings();
}
