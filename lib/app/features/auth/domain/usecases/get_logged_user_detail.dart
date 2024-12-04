import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:vendor_registration/app/features/auth/domain/entities/user.dart';

class GetLoggedUserDetail {
  final AuthRepository authRepository;

  GetLoggedUserDetail(this.authRepository);

  Future<Either<Failure, User>> call() async {
    return await authRepository.getLoggedUserDetail();
  }
}
