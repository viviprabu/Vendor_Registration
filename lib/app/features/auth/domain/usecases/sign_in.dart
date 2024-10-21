import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/auth/domain/entities/token.dart';
import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';

class SignIn {
  final AuthRepository authRepository;

  SignIn(this.authRepository);

  Future<Either<Failure, Token>> call(String userName, String password) async {
    return await authRepository.signIn(userName, password);
  }
}
