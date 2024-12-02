import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/user_permission/domain/entities/role_function.dart';
import 'package:finance_app/app/features/user_permission/domain/repositories/user_permission_repository.dart';

class GetUserRoleFunctions {
  final UserPermissionRepository userPermissionRepository;

  GetUserRoleFunctions(this.userPermissionRepository);

  Future<Either<Failure, List<RoleFunction>>> call(int roleId) async {
    return userPermissionRepository.getUserRoleFunctions(roleId);
  }
}
