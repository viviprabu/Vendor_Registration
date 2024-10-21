import 'package:finance_app/app/features/user/data/models/user_create_model.dart';
import 'package:finance_app/app/features/user/data/models/user_model.dart';

abstract interface class UserRemoteDataSource {
  Future<UserModel> getUser(String id);
  Future<UserModel> updateUser(UserModel userModel);
  Future<UserModel> deleteUser(UserModel userModel);
  Future<UserModel> createUser(UserCreateModel userCreateModel);
  Future<List<UserModel>> getUsers();
}
