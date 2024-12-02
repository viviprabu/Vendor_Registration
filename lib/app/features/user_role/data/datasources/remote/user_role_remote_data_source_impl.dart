import 'dart:convert';

import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/user_role/data/datasources/user_role_remote_data_source.dart';
import 'package:finance_app/app/features/user_role/data/models/role_function_model.dart';
import 'package:finance_app/app/features/user_role/data/models/system_function_model.dart';
import 'package:finance_app/app/features/user_role/data/models/user_role_model.dart';

class UserRoleRemoteDataSourceImpl implements UserRoleRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  UserRoleRemoteDataSourceImpl({
    required this.httpClientWithInterceptor,
  });

  @override
  Future<UserRoleModel> createUserRole(UserRoleModel userRoleModel) async {
    final response = await httpClientWithInterceptor.post(
      '${AppConfig.applicationId}/${ApiUrls.createRole}',
      data: userRoleModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final responseBody = json.decode(response.body);
    return UserRoleModel.fromJson(responseBody);
  }

  @override
  Future<List<RoleFunctionModel>> getUserRoleFunctions(int id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getRoleFunctions}?roleId=$id',
    );

    final responseBody = json.decode(response.body);

    final List<RoleFunctionModel> roleFunctions = (responseBody as List)
        .map((roleFunctions) => RoleFunctionModel.fromJson(roleFunctions))
        .toList();

    return roleFunctions;
  }

  @override
  Future<List<UserRoleModel>> listUserRoles() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.listRoles}',
    );

    final responseBody = json.decode(response.body);
    final List<UserRoleModel> userRoles = (responseBody as List)
        .map((userRoles) => UserRoleModel.fromJson(userRoles))
        .toList();
    return userRoles;
  }

  @override
  Future<UserRoleModel> updateUserRole(UserRoleModel userRoleModel) async {
    final response = await httpClientWithInterceptor.post(
      '${AppConfig.applicationId}/${ApiUrls.updateRole}',
      data: userRoleModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return UserRoleModel.fromJson(responseBody);
  }

  @override
  Future<List<SystemFunctionModel>> listSystemFunctions() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.listSystemFunctions}',
    );

    final responseBody = json.decode(response.body);
    final List<SystemFunctionModel> systemFunctions = (responseBody as List)
        .map((systemFunctions) => SystemFunctionModel.fromJson(systemFunctions))
        .toList();
    return systemFunctions;
  }
}
