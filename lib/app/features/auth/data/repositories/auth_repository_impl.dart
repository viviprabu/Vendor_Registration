import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:finance_app/app/features/auth/data/models/auth_model.dart';
import 'package:finance_app/app/features/auth/data/models/token_model.dart';
import 'package:finance_app/app/features/auth/domain/entities/token.dart';
import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<bool> isLoggedIn() async {
    try {
      return await authRemoteDataSource.isLoggedIn();
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either<Failure, Token>> signIn(
      String userName, String password) async {
    try {
      //print('hello');
      TokenModel singedInUser = await authRemoteDataSource
          .signIn(AuthModel(userName: userName, password: password));
      return Right(singedInUser.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      return Right(authRemoteDataSource.signOut());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getLoggedUserDetail() async {
    try {
      final userModel = await authRemoteDataSource.getLoggedUserDetail();
      return Right(userModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
