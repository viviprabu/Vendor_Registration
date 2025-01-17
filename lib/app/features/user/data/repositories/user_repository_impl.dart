import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:vendor_registration/app/features/user/data/models/user_create_model.dart';
import 'package:vendor_registration/app/features/user/data/models/user_model.dart';
import 'package:vendor_registration/app/features/user/data/models/user_update_model.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user_create.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user_update.dart';
import 'package:vendor_registration/app/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, User>> createUser(UserCreate userCreate) async {
    try {
      final UserCreateModel userCreateModel =
          UserCreateModel.fromEntity(userCreate);
      final UserModel createdUser =
          await userRemoteDataSource.createUser(userCreateModel);
      //print(createdUser);
      return Right(createdUser.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, User>> deleteUser(User user) async {
    try {
      final UserModel deletedUser =
          await userRemoteDataSource.deleteUser(user as UserModel);
      return Right(deletedUser.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getUser(String id) async {
    try {
      final UserModel user = await userRemoteDataSource.getUser(id);
      return Right(user.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final List<UserModel> users = await userRemoteDataSource.getUsers();
      final List<User> usersList =
          users.map((user) => user.toEntity()).toList();
      return Right(usersList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(UserUpdate userUpdate) async {
    try {
      /* final UserModel updatedUser =
          await userRemoteDataSource.updateUser(user as UserModel);
      return Right(updatedUser.toEntity()); */

      final UserUpdateModel userUpdateModel =
          UserUpdateModel.fromEntity(userUpdate);
      final UserModel updatedUser =
          await userRemoteDataSource.updateUser(userUpdateModel);
      return Right(updatedUser.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
