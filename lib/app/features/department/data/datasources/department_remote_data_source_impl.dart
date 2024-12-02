import 'dart:convert';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/department/data/datasources/department_remote_data_source.dart';
import 'package:finance_app/app/features/department/data/models/department_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final HttpClient httpClient;

  DepartmentRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<DepartmentModal> deleteDepartment(DepartmentModal depatModel) async {
    final response = await httpClient.delete(
      '${AppConfig.applicationId}/${ApiUrls.department}/${depatModel.id}',
      data: depatModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<DepartmentModal> getDepartment(int id) async {
    final response = await httpClient.get(
      '${AppConfig.applicationId}/${ApiUrls.getDept}?id=$id',
      //ApiUrls.userProfile,
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<List<DepartmentModal>> getDepartments() async {
    final response = await httpClient.get(
      '${AppConfig.applicationId}/${ApiUrls.department}',
    );

    final responseBody = json.decode(response.body);
    final List<DepartmentModal> dept = (responseBody as List)
        .map((dept) => DepartmentModal.fromJson(dept))
        .toList();

    return dept;
  }

  @override
  Future<DepartmentModal> updateDepartment(DepartmentModal deptModel) async {
    final response = await httpClient.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      '${AppConfig.applicationId}/${ApiUrls.updateDept}',
      data: deptModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<DepartmentModal> createDepartment(DepartmentModal deptModel) async {
    final response = await httpClient.post(
      '${AppConfig.applicationId}/${ApiUrls.createDept}',
      data: deptModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }
}
