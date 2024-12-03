import 'dart:convert';
import 'package:vendor_registration/app/core/app_config/app_config.dart';
import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/department_remote_data_source.dart';
import 'package:vendor_registration/app/features/registration/data/models/department_modal.dart';

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  DepartmentRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<DepartmentModal> deleteDepartment(DepartmentModal depatModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${AppConfig.applicationId}/${ApiUrls.department}/${depatModel.id}',
      data: depatModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<DepartmentModal> getDepartment(int id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getDept}?id=$id',
      //ApiUrls.userProfile,
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<List<DepartmentModal>> getDepartments() async {
    final response = await httpClientWithInterceptor.get(
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
    final response = await httpClientWithInterceptor.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      '${AppConfig.applicationId}/${ApiUrls.updateDept}',
      data: deptModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<DepartmentModal> createDepartment(DepartmentModal deptModel) async {
    final response = await httpClientWithInterceptor.post(
      '${AppConfig.applicationId}/${ApiUrls.createDept}',
      data: deptModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }
}
