import 'package:finance_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, List<User>>> call() async {
    return await repository.getUsers();
  }
}
