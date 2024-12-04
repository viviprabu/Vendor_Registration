import 'package:vendor_registration/app/features/user_role/domain/entities/system_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class ListSystemFunctions {
  final UserRoleRepository userRoleRepository;

  ListSystemFunctions(this.userRoleRepository);

  Future<Either<Failure, List<SystemFunction>>> call() async {
    return userRoleRepository.listSystemFunctions();
  }
}
