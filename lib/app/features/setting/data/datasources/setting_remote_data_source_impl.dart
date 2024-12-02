import 'dart:convert';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:finance_app/app/features/setting/data/models/setting_create_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_update_model.dart';

class SettingRemoteDataSourceImpl implements SettingRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  SettingRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<SettingModal> createSetting(
      SettingCreateModal settingCreateModel) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var token = sharedPreferences.getString('token');

    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.createSetting}',
      data: settingCreateModel.toFormData(),
      // headers: {
      //   'Authorization': 'Bearer $token',
      // },
    );
    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }

  @override
  Future<SettingModal> deleteSetting(SettingModal settingModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${AppConfig.applicationId}/${ApiUrls.setting}/${settingModel.id}',
      data: settingModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }

  @override
  Future<SettingModal> getSetting(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getSetting}?id=$id',
      //ApiUrls.SettingProfile,
    );

    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }

  @override
  Future<List<SettingModal>> getSettings() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.setting}',
    );

    final responseBody = json.decode(response.body);
    final List<SettingModal> settings = (responseBody as List)
        .map((setting) => SettingModal.fromJson(setting))
        .toList();
    return settings;
  }

  @override
  Future<SettingModal> updateSetting(
      SettingUpdateModal settingUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.updateSetting}',
      data: settingUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }
}
