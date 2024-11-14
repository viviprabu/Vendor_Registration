import 'dart:convert';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:finance_app/app/features/setting/data/models/setting_create_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRemoteDataSourceImpl implements SettingRemoteDataSource {
  final HttpClient httpClient;

  SettingRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<SettingModal> createSetting(
      SettingCreateModal settingCreateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.createSetting,
      data: settingCreateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }

  @override
  Future<SettingModal> deleteSetting(SettingModal settingModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.delete(
      '${ApiUrls.setting}/${settingModel.id}',
      data: settingModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }

  @override
  Future<SettingModal> getSetting(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      '${ApiUrls.getSetting}?id=$id',
      //ApiUrls.SettingProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }

  @override
  Future<List<SettingModal>> getSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      ApiUrls.setting,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.updateSetting,
      data: settingUpdateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SettingModal.fromJson(responseBody);
  }
}
