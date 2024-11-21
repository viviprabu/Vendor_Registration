import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/features/request_status/data/datasources/request_status_remote_data_source.dart';
import 'package:finance_app/app/features/request_status/data/models/request_status_model.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestStatusRemoteDataSourceImpl
    implements RequestStatusRemoteDataSource {
  final HttpClient httpClient;

  RequestStatusRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<RequestStatusModel> createRequestStatus(
      RequestStatusModel requestStatusModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.post(
      '$applicationId/${ApiUrls.createRequestStatus}',
      data: requestStatusModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    //print(requestStatusModel.toJson());
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }

  @override
  Future<RequestStatusModel> deleteRequestStatus(
      RequestStatusModel requestStatusModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.delete(
      '$applicationId/${ApiUrls.deleteRequestStatus}/${requestStatusModel.id}',
      data: requestStatusModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }

  @override
  Future<RequestStatusModel> getRequestStatus(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.getRequestStatus}/$id',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }

  @override
  Future<List<RequestStatusModel>> listRequestStatuses() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.listRequestStatus}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.put(
      '$applicationId/${ApiUrls.updateRequestStatus}/${requestStatusModel.id}',
      data: requestStatusModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return RequestStatusModel.fromJson(responseBody);
  }
}
