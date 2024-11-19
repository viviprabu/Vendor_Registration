import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/user_role/data/datasources/user_role_remote_data_source.dart';
import 'package:finance_app/app/features/user_role/data/models/role_function_model.dart';
import 'package:finance_app/app/features/user_role/data/models/system_function_model.dart';
import 'package:finance_app/app/features/user_role/data/models/user_role_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRoleRemoteDataSourceImpl implements UserRoleRemoteDataSource {
  final HttpClient httpClient;
  UserRoleRemoteDataSourceImpl({required this.httpClient});
  @override
  Future<UserRoleModel> createUserRole(UserRoleModel userRoleModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    print(userRoleModel);

    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.post(
      '$applicationId/${ApiUrls.createRole}',
      data: userRoleModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return UserRoleModel.fromJson(responseBody);
  }

  @override
  Future<List<RoleFunctionModel>> getUserRoleFunctions(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.getRole}?roleId=$id',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);

    final List<RoleFunctionModel> roleFunctions = (responseBody as List)
        .map((roleFunctions) => RoleFunctionModel.fromJson(roleFunctions))
        .toList();

    return roleFunctions;
  }

  @override
  Future<List<UserRoleModel>> listUserRoles() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.listRoles}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<UserRoleModel> userRoles = (responseBody as List)
        .map((userRoles) => UserRoleModel.fromJson(userRoles))
        .toList();
    //print(responseBody);
    return userRoles;
  }

  @override
  Future<UserRoleModel> updateUserRole(UserRoleModel userRoleModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '1';

    //print(userRoleModel.toJson());

    final response = await httpClient.post(
      '$applicationId/${ApiUrls.updateRole}',
      data: userRoleModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return UserRoleModel.fromJson(responseBody);
  }

  @override
  Future<List<SystemFunctionModel>> listSystemFunctions() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.listSystemFunctions}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<SystemFunctionModel> systemFunctions = (responseBody as List)
        .map((systemFunctions) => SystemFunctionModel.fromJson(systemFunctions))
        .toList();
    //print(responseBody);
    return systemFunctions;
  }
}
