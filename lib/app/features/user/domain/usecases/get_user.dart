import 'package:finance_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<Either<Failure, User>> call(String id) async {
    return await repository.getUser(id);
  }
}
