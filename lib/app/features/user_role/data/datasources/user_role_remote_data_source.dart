import 'package:finance_app/app/features/user_role/data/models/system_function_model.dart';
import 'package:finance_app/app/features/user_role/data/models/user_role_model.dart';

abstract interface class UserRoleRemoteDataSource {
  Future<UserRoleModel> getUserRole(int id);
  Future<UserRoleModel> updateUserRole(UserRoleModel userRoleModel);
  Future<UserRoleModel> createUserRole(UserRoleModel userRoleModel);
  Future<List<UserRoleModel>> listUserRoles();
  Future<List<SystemFunctionModel>> listSystemFunctions();
}
