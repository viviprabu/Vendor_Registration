import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/features/auth/domain/repositories/auth_repository.dart';

class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either> call() async {
    return await repository.signOut();
  }
}
