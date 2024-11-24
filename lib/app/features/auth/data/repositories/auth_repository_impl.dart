import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:finance_app/app/features/auth/data/models/auth_model.dart';
import 'package:finance_app/app/features/auth/data/models/token_model.dart';
import 'package:finance_app/app/features/auth/domain/entities/token.dart';
import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:finance_app/app/features/auth/domain/entities/user.dart';

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
      print(e);
      var error = e.toString();

      if (error.startsWith('Exception:')) {
        error = error.replaceFirst('Exception:', '').trim();
      }

      String errorMessage = 'Invalid Username or Password';
      int errorCode = 400;

      Map<String, dynamic> errorData = jsonDecode(error);
      errorMessage = errorData['message'] ?? errorMessage;
      errorCode = errorData['code'] ?? errorCode;

      try {
        Map<String, dynamic> errorData = jsonDecode(error);
        errorMessage = errorData['message'] ?? errorMessage;
        errorCode = errorData['code'] ?? errorCode;
      } catch (_) {
        errorMessage = error;
        errorCode = 400;
      }
      if (error.contains('401')) {
        return Left(ServerFailure(errorMessage));
      } else {
        return Left(ServerFailure(errorMessage));
      }
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
