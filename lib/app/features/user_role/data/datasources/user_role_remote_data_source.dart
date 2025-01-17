import 'package:vendor_registration/app/features/user_role/data/models/role_function_model.dart';
import 'package:vendor_registration/app/features/user_role/data/models/system_function_model.dart';
import 'package:vendor_registration/app/features/user_role/data/models/user_role_model.dart';

abstract interface class UserRoleRemoteDataSource {
  Future<List<RoleFunctionModel>> getUserRoleFunctions(int id);
  Future<UserRoleModel> updateUserRole(UserRoleModel userRoleModel);
  Future<UserRoleModel> createUserRole(UserRoleModel userRoleModel);
  Future<List<UserRoleModel>> listUserRoles();
  Future<List<SystemFunctionModel>> listSystemFunctions();
}
