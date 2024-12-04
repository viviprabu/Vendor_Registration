import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client.dart';
import 'package:vendor_registration/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vendor_registration/app/features/auth/data/models/auth_model.dart';
import 'package:vendor_registration/app/features/auth/data/models/token_model.dart';
import 'package:vendor_registration/app/features/auth/data/models/user_model.dart';
import 'package:vendor_registration/app/models/_variable_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final HttpClient httpClient;

  AuthRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<bool> isLoggedIn() async {
    // check if token is present in shared preferences
    final sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    VariableModal.token = sharedPreferences.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<TokenModel> signIn(AuthModel authModel) async {
    final response = await httpClient.post(
      ApiUrls.login,
      data: authModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    // save token to shared preferences
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', responseBody['accessToken']);

    /* sharedPreferences.setStringList(
        'userRights', responseBody['token']['user']['userRights']); */
    //sharedPreferences.setStringList('token', responseBody);
    //print(sharedPreferences);
    //return AuthModel.fromJson(responseBody);
    //print(responseBody['token']['user']);

    //final userRights = responseBody['token']['user']['userRights'];

    //responseBody['token']['user']['userRights'];

    final UserModel userModel = UserModel.fromJson(responseBody['user']);
    sharedPreferences.setString(
        'loggedUserDetails', json.encode(userModel.toJson()));

    //print(sharedPreferences.getString('loggedUserDetails'));

    //print('User Rights: ${responseBody['user']['userRights']}');

    return TokenModel.fromJson(responseBody);
  }

  @override
  Future<Either> signOut() async {
    // remove token from shared preferences
    /* return SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.remove('token');
    }); */
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return const Right(true);
  }

  @override
  Future<UserModel> getLoggedUserDetail() {
    // get user details from shared preferences
    final sharedPreferences = SharedPreferences.getInstance();
    final user = sharedPreferences.then((value) {
      final user = value.getString('loggedUserDetails');
      if (user != null) {
        return UserModel.fromJson(json.decode(user));
      } else {
        throw Exception();
      }
    });
    return user;

    /* final sharedPreferences = await SharedPreferences.getInstance();
    final userDetails = sharedPreferences.getString('loggedUserDetails');
    if (userDetails != null) {
      return UserModel.fromJson(json.decode(userDetails));
    } else {
      throw Exception();
    } */
  }
}
