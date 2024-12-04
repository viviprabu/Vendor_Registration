import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/auth/domain/entities/token.dart';
import 'package:vendor_registration/app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Token>> signIn(String userName, String password);
  Future<Either> signOut();
  Future<bool> isLoggedIn();
  Future<Either<Failure, User>> getLoggedUserDetail();
}
