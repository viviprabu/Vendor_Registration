import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:finance_app/app/features/user/data/models/user_create_model.dart';
import 'package:finance_app/app/features/user/data/models/user_model.dart';
import 'package:finance_app/app/features/user/data/models/user_update_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final HttpClient httpClient;

  UserRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<UserModel> createUser(UserCreateModel userCreateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.createUser,
      data: userCreateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }

  @override
  Future<UserModel> deleteUser(UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.delete(
      '${ApiUrls.users}/${userModel.id}',
      data: userModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }

  @override
  Future<UserModel> getUser(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      '${ApiUrls.userProfile}?id=$id',
      //ApiUrls.userProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }

  @override
  Future<List<UserModel>> getUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      ApiUrls.users,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<UserModel> users =
        (responseBody as List).map((user) => UserModel.fromJson(user)).toList();
    return users;
  }

  @override
  Future<UserModel> updateUser(UserUpdateModel userUpdateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    /* final response = await httpClient.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      ApiUrls.updateUser,
      data: userUpdateModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ); */

    final response = await httpClient.postFormData(
      ApiUrls.updateUser,
      data: userUpdateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return UserModel.fromJson(responseBody);
  }
}
