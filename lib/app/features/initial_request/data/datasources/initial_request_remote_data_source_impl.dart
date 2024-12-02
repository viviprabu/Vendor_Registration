import 'dart:convert';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/initial_request/data/datasources/initial_request_remote_data_source.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_create_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_update_model.dart';

class InitialRequestRemoteDataSourceImpl
    implements InitialRequestRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  InitialRequestRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<InitialRequestModal> createInitialRequest(
      InitialRequestCreateModal initialRequestCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.createInitialRequest}',
      data: initialRequestCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }

  @override
  Future<InitialRequestModal> deleteInitialRequest(
      InitialRequestModal initialRequestModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${AppConfig.applicationId}/${ApiUrls.initialRequest}/${initialRequestModel.id}',
      data: initialRequestModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }

  @override
  Future<InitialRequestModal> getInitialRequest(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getInitialRequest}?id=$id',
      //ApiUrls.SettingProfile,
    );

    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }

  @override
  Future<List<InitialRequestModal>> getInitialRequests() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.initialRequest}',
    );

    final responseBody = json.decode(response.body);
    final List<InitialRequestModal> initialRequest = (responseBody as List)
        .map((initialRequest) => InitialRequestModal.fromJson(initialRequest))
        .toList();
    return initialRequest;
  }

  @override
  Future<InitialRequestModal> updateInitialRequest(
      InitialRequestUpdateModal initialRequestUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.updateInitialRequest}',
      data: initialRequestUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }
}
