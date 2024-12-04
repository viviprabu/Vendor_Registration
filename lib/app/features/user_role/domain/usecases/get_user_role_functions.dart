import 'package:vendor_registration/app/features/user_role/domain/entities/role_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class GetUserRoleFunctions {
  final UserRoleRepository userRoleRepository;

  GetUserRoleFunctions(this.userRoleRepository);

  Future<Either<Failure, List<RoleFunction>>> call(int id) async {
    return userRoleRepository.getUserRoleFunctions(id);
  }
}
