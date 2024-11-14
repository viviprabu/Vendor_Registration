import 'package:finance_app/app/features/user_role/domain/entities/user_role.dart';
import 'package:finance_app/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class CreateUserRole {
  final UserRoleRepository userRoleRepository;
  CreateUserRole(this.userRoleRepository);

  Future<Either<Failure, UserRole>> call(UserRole userRole) async {
    return userRoleRepository.createUserRole(userRole);
  }
}
