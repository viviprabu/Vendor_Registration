import 'dart:convert';
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
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.delete(
      '$applicationId/${ApiUrls.department}/${depatModel.id}',
      data: depatModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<DepartmentModal> getDepartment(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.getDept}?id=$id',
      //ApiUrls.userProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<List<DepartmentModal>> getDepartments() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.department}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<DepartmentModal> dept = (responseBody as List)
        .map((dept) => DepartmentModal.fromJson(dept))
        .toList();
    print(responseBody);
    return dept;
  }

  @override
  Future<DepartmentModal> updateDepartment(DepartmentModal deptModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      '$applicationId/${ApiUrls.updateDept}',
      data: deptModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }

  @override
  Future<DepartmentModal> createDepartment(DepartmentModal deptModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.postFormData(
      '$applicationId/${ApiUrls.createDept}',
      data: deptModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return DepartmentModal.fromJson(responseBody);
  }
}
