import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:finance_app/app/features/user/domain/entities/user_create.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, User>> deleteUser(User user);
  Future<Either<Failure, User>> createUser(UserCreate userCreate);
  Future<Either<Failure, List<User>>> getUsers();
}
