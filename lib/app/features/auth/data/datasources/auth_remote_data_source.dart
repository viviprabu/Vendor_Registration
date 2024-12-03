import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/features/auth/data/models/auth_model.dart';
import 'package:vendor_registration/app/features/auth/data/models/token_model.dart';
import 'package:vendor_registration/app/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<TokenModel> signIn(AuthModel authModel);
  Future<Either> signOut();
  Future<bool> isLoggedIn();
  Future<UserModel> getLoggedUserDetail();
}
