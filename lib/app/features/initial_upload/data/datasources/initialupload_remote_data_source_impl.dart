import 'dart:convert';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/initial_upload/data/datasources/initialupload_remote_data_source.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initialupload_create_model.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initialupload_model.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initialupload_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialUploadRemoteDataSourceImpl
    implements InitialUploadRemoteDataSource {
  final HttpClient httpClient;

  InitialUploadRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<InitialUploadModal> createInitialUpload(
      InitialUploadCreateModal initialUploadCreateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.createInitialUpload,
      data: initialUploadCreateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return InitialUploadModal.fromJson(responseBody);
  }

  @override
  Future<InitialUploadModal> deleteInitialUpload(
      InitialUploadModal initialUploadModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.delete(
      '${ApiUrls.initialUpload}/${initialUploadModel.id}',
      data: initialUploadModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return InitialUploadModal.fromJson(responseBody);
  }

  @override
  Future<InitialUploadModal> getInitialUpload(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      '${ApiUrls.getInitialUpload}?id=$id',
      //ApiUrls.SettingProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return InitialUploadModal.fromJson(responseBody);
  }

  @override
  Future<List<InitialUploadModal>> getInitialUploads() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      ApiUrls.initialUpload,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<InitialUploadModal> initialUpload = (responseBody as List)
        .map((initialUpload) => InitialUploadModal.fromJson(initialUpload))
        .toList();
    return initialUpload;
  }

  @override
  Future<InitialUploadModal> updateInitialUpload(
      InitialUploadUpdateModal initialUploadUpdateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.updateInitialUpload,
      data: initialUploadUpdateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return InitialUploadModal.fromJson(responseBody);
  }
}
