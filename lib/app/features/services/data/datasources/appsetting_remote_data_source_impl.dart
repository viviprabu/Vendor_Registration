import 'dart:convert';

import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/services/data/datasources/appsetting_remote_data_source.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_update_model.dart';

class AppSettingRemoteDataSourceImpl implements AppSettingRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  AppSettingRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<AppSettingModal> createAppSetting(
      AppSettingModal appSettingModel) async {
    final response = await httpClientWithInterceptor.post(
      '${AppConfig.applicationId}/${ApiUrls.createAppSetting}',
      data: appSettingModel.toJson(),
    );
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
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getAppSetting}/$id',
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Authorization': 'Bearer $token',
      // },
    );
    final responseBody = json.decode(response.body);
    return AppSettingModal.fromJson(responseBody);
  }

  @override
  Future<List<AppSettingModal>> getAppSettings() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.appSetting}',
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
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.updateUser}',
      data: appSettingUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return AppSettingModal.fromJson(responseBody);
  }
}
