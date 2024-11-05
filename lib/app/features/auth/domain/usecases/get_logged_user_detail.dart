import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';

class GetLoggedUserDetail {
  final AuthRepository authRepository;

  GetLoggedUserDetail(this.authRepository);

  Future<Either<Failure, User>> call() async {
    return await authRepository.getLoggedUserDetail();
  }
}
