import 'dart:convert';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/assigned_list/data/datasources/assigned_list_remote_data_source.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_create_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignedListRemoteDataSourceImpl implements AssignedListRemoteDataSource {
  final HttpClient httpClient;

  AssignedListRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<AssignedListModal> createAssignedList(
      AssignedListCreateModal assignedListCreateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.createAssignedList,
      data: assignedListCreateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }

  @override
  Future<AssignedListModal> deleteAssignedList(
      AssignedListModal assignedListModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.delete(
      '${ApiUrls.assignedList}/${assignedListModel.id}',
      data: assignedListModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }

  @override
  Future<AssignedListModal> getAssignedList(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      '${ApiUrls.getAssignedList}?id=$id',
      //ApiUrls.SettingProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }

  @override
  Future<List<AssignedListModal>> getAssignedLists() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      ApiUrls.assignedList,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<AssignedListModal> assignedList = (responseBody as List)
        .map((assignedList) => AssignedListModal.fromJson(assignedList))
        .toList();
    return assignedList;
  }

  @override
  Future<AssignedListModal> updateAssignedList(
      AssignedListUpdateModal assignedListUpdateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.updateAssignedList,
      data: assignedListUpdateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }
}
