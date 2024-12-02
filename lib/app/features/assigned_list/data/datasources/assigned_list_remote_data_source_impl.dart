import 'dart:convert';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/assigned_list/data/datasources/assigned_list_remote_data_source.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_create_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_update_model.dart';

class AssignedListRemoteDataSourceImpl implements AssignedListRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  AssignedListRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<AssignedListModal> createAssignedList(
      AssignedListCreateModal assignedListCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.createAssignedList}',
      data: assignedListCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }

  @override
  Future<AssignedListModal> deleteAssignedList(
      AssignedListModal assignedListModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${AppConfig.applicationId}/${ApiUrls.assignedList}/${assignedListModel.id}',
      data: assignedListModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }

  @override
  Future<AssignedListModal> getAssignedList(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getAssignedList}?id=$id',
      //ApiUrls.SettingProfile,
    );

    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }

  @override
  Future<List<AssignedListModal>> getAssignedLists() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.assignedList}',
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
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.updateAssignedList}',
      data: assignedListUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return AssignedListModal.fromJson(responseBody);
  }
}
