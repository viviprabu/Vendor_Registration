import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user_create.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user_update.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User>> getUser(String id);
  Future<Either<Failure, User>> updateUser(UserUpdate userUpdate);
  Future<Either<Failure, User>> deleteUser(User user);
  Future<Either<Failure, User>> createUser(UserCreate userCreate);
  Future<Either<Failure, List<User>>> getUsers();
}
