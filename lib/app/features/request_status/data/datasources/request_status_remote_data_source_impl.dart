import 'dart:convert';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/request_status/data/datasources/request_status_remote_data_source.dart';
import 'package:finance_app/app/features/request_status/data/models/request_status_model.dart';

class RequestStatusRemoteDataSourceImpl
    implements RequestStatusRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  RequestStatusRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<RequestStatusModel> createRequestStatus(
      RequestStatusModel requestStatusModel) async {
    final response = await httpClientWithInterceptor.post(
      '${AppConfig.applicationId}/${ApiUrls.createRequestStatus}',
      data: requestStatusModel.toJson(),
    );
    //print(requestStatusModel.toJson());
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }

  @override
  Future<RequestStatusModel> deleteRequestStatus(
      RequestStatusModel requestStatusModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${AppConfig.applicationId}/${ApiUrls.deleteRequestStatus}/${requestStatusModel.id}',
      data: requestStatusModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }

  @override
  Future<RequestStatusModel> getRequestStatus(int id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getRequestStatus}/$id',
    );
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }

  @override
  Future<List<RequestStatusModel>> listRequestStatuses() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.listRequestStatus}',
    );

    final responseBody = json.decode(response.body);
    final List<RequestStatusModel> requestStatuses = (responseBody as List)
        .map((requestStatus) => RequestStatusModel.fromJson(requestStatus))
        .toList();
    return requestStatuses;
  }

  @override
  Future<RequestStatusModel> updateRequestStatus(
      RequestStatusModel requestStatusModel) async {
    final response = await httpClientWithInterceptor.put(
      '${AppConfig.applicationId}/${ApiUrls.updateRequestStatus}/${requestStatusModel.id}',
      data: requestStatusModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }
}
