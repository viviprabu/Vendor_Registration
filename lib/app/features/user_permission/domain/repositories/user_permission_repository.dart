import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/user_permission/domain/entities/role_function.dart';

abstract interface class UserPermissionRepository {
  Future<Either<Failure, List<RoleFunction>>> getUserRoleFunctions(int roleId);
}
