import 'dart:convert';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/initial_request/data/datasources/initial_request_remote_data_source.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_create_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialRequestRemoteDataSourceImpl
    implements InitialRequestRemoteDataSource {
  final HttpClient httpClient;

  InitialRequestRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<InitialRequestModal> createInitialRequest(
      InitialRequestCreateModal initialRequestCreateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.createInitialRequest,
      data: initialRequestCreateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }

  @override
  Future<InitialRequestModal> deleteInitialRequest(
      InitialRequestModal initialRequestModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.delete(
      '${ApiUrls.initialRequest}/${initialRequestModel.id}',
      data: initialRequestModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }

  @override
  Future<InitialRequestModal> getInitialRequest(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      '${ApiUrls.getInitialRequest}?id=$id',
      //ApiUrls.SettingProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }

  @override
  Future<List<InitialRequestModal>> getInitialRequests() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      ApiUrls.initialRequest,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.updateInitialRequest,
      data: initialRequestUpdateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return InitialRequestModal.fromJson(responseBody);
  }
}
