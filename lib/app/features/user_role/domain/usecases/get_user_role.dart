import 'package:finance_app/app/features/user_role/domain/entities/user_role.dart';
import 'package:finance_app/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetUserRole {
  final UserRoleRepository userRoleRepository;

  GetUserRole(this.userRoleRepository);

  Future<Either<Failure, UserRole>> call(int id) async {
    return userRoleRepository.getUserRole(id);
  }
}
