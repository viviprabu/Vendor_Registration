import 'package:vendor_registration/app/features/user/data/models/user_create_model.dart';
import 'package:vendor_registration/app/features/user/data/models/user_model.dart';
import 'package:vendor_registration/app/features/user/data/models/user_update_model.dart';

abstract interface class UserRemoteDataSource {
  Future<UserModel> getUser(String id);
  Future<UserModel> updateUser(UserUpdateModel userUpdateModel);
  Future<UserModel> deleteUser(UserModel userModel);
  Future<UserModel> createUser(UserCreateModel userCreateModel);
  Future<List<UserModel>> getUsers();
}
