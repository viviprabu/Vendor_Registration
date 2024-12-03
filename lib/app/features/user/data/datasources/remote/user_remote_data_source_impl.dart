import 'dart:convert';

import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:vendor_registration/app/features/user/data/models/user_create_model.dart';
import 'package:vendor_registration/app/features/user/data/models/user_model.dart';
import 'package:vendor_registration/app/features/user/data/models/user_update_model.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;
  UserRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<UserModel> createUser(UserCreateModel userCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.createUser,
      data: userCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }

  @override
  Future<UserModel> deleteUser(UserModel userModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${ApiUrls.users}/${userModel.id}',
      data: userModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${ApiUrls.userProfile}?id=$id',
    );

    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await httpClientWithInterceptor.get(
      ApiUrls.users,
    );

    final responseBody = json.decode(response.body);
    final List<UserModel> users =
        (responseBody as List).map((user) => UserModel.fromJson(user)).toList();
    return users;
  }

  @override
  Future<UserModel> updateUser(UserUpdateModel userUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.updateUser,
      data: userUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }
}
