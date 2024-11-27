import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/user_permission/domain/entities/role_function.dart';

abstract interface class UserPermissionRepository {
  Future<Either<Failure, List<RoleFunction>>> getUserRoleFunctions(int roleId);
}
