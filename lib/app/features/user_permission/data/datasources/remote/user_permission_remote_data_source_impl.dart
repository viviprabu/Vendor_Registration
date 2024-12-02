import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/user_permission/data/datasources/user_permission_remote_data_source.dart';
import 'package:finance_app/app/features/user_permission/data/models/role_function_model.dart';

class UserPermissionRemoteDataSourceImpl
    implements UserPermissionRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  UserPermissionRemoteDataSourceImpl({
    required this.httpClientWithInterceptor,
  });

  @override
  Future<List<RoleFunctionModel>> getUserRoleFunctions(int roleId) async {
    var applicationId = '1';
    final response = await httpClientWithInterceptor.get(
      '$applicationId/${ApiUrls.getRoleFunctions}?roleId=$roleId',
    );

    final responseBody = json.decode(response.body);

    final List<RoleFunctionModel> roleFunctions = (responseBody as List)
        .map((roleFunctions) => RoleFunctionModel.fromJson(roleFunctions))
        .toList();

    return roleFunctions;
  }
}
