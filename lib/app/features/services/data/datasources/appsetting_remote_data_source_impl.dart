import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/services/data/datasources/appsetting_remote_data_source.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_roles_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_update_model.dart';
import 'package:finance_app/app/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingRemoteDataSourceImpl implements AppSettingRemoteDataSource {
  final HttpClient httpClient;

  AppSettingRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<AppSettingModal> createAppSetting(
      AppSettingModal appSettingModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.post(
      '$applicationId/${ApiUrls.createAppSetting}',
      data: appSettingModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(appSettingModel.toJson());
    final responseBody = json.decode(response.body);
    return AppSettingModal.fromJson(responseBody);
  }

  @override
  Future<AppSettingModal> deleteAppSetting(AppSettingModal appSettingModel) {
    // TODO: implement deleteSector
    throw UnimplementedError();
  }

  @override
  Future<AppSettingModal> getAppSetting(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.getAppSetting}/$id',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return AppSettingModal.fromJson(responseBody);
  }

  @override
  Future<List<AppSettingModal>> getAppSettings() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.appSetting}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<AppSettingModal> appSetting = (responseBody as List)
        .map((appSetting) => AppSettingModal.fromJson(appSetting))
        .toList();

    return appSetting;
  }

  @override
  Future<AppSettingModal> updateAppSetting(
      AppSettingUpdateModal appSettingUpdateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    /* final response = await httpClient.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      ApiUrls.updateUser,
      data: userUpdateModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ); */

    final response = await httpClient.postFormData(
      ApiUrls.updateUser,
      data: appSettingUpdateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return AppSettingModal.fromJson(responseBody);
  }
}
