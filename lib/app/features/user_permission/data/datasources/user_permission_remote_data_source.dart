import 'package:finance_app/app/features/user_permission/data/models/role_function_model.dart';

abstract interface class UserPermissionRemoteDataSource {
  Future<List<RoleFunctionModel>> getUserRoleFunctions(int roleId);
}
