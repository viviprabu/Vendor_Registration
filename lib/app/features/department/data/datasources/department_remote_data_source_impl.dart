import 'dart:convert';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/department/data/datasources/department_remote_data_source.dart';
import 'package:finance_app/app/features/department/data/models/department_create_modal.dart';
import 'package:finance_app/app/features/department/data/models/department_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepartmentRemoteDataSourceImpl implements DepartmentRemoteDataSource {
  final HttpClient httpClient;

  DepartmentRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<DepartmentModal> deleteDept(DepartmentModal depatModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.delete(
<<<<<<< HEAD
      '$applicationId/${ApiUrls.department}/${depatModel.id}',
=======
      '$applicationId/${ApiUrls.getDepts}/${depatModel.id}',
>>>>>>> ca82328f654ece701a8396a23b0231b55bd1c691
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
  Future<DepartmentModal> getDept(String id) async {
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
  Future<List<DepartmentModal>> getDepts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
<<<<<<< HEAD
      '$applicationId/${ApiUrls.department}',
=======
      '$applicationId/${ApiUrls.getDepts}',
>>>>>>> ca82328f654ece701a8396a23b0231b55bd1c691
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<DepartmentModal> dept = (responseBody as List)
        .map((dept) => DepartmentModal.fromJson(dept))
        .toList();
    return dept;
  }

  @override
  Future<DepartmentModal> updateDept(DepartmentModal deptModel) async {
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
  Future<DepartmentModal> createDept(DepartmentCreateModal deptModel) async {
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
