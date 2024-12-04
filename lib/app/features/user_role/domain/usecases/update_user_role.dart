import 'package:vendor_registration/app/features/user_role/domain/entities/user_role.dart';
import 'package:vendor_registration/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class UpdateUserRole {
  final UserRoleRepository userRoleRepository;
  UpdateUserRole(this.userRoleRepository);

  Future<Either<Failure, UserRole>> call(UserRole userRole) async {
    return userRoleRepository.updateUserRole(userRole);
  }
}
