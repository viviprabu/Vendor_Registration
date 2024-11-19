import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/user_role/domain/entities/role_function.dart';
import 'package:finance_app/app/features/user_role/domain/entities/system_function.dart';
import 'package:finance_app/app/features/user_role/domain/entities/user_role.dart';

abstract interface class UserRoleRepository {
  Future<Either<Failure, List<RoleFunction>>> getUserRoleFunctions(int id);
  Future<Either<Failure, UserRole>> updateUserRole(UserRole userRole);
  Future<Either<Failure, UserRole>> createUserRole(UserRole userRole);
  Future<Either<Failure, List<UserRole>>> listUserRoles();
  Future<Either<Failure, List<SystemFunction>>> listSystemFunctions();
}
