import 'package:vendor_registration/app/features/user/domain/entities/user_create.dart';
import 'package:vendor_registration/app/features/user/domain/repositories/user_repository.dart';
import 'package:vendor_registration/app/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class CreateUser {
  final UserRepository userRepository;

  CreateUser(this.userRepository);

  Future<Either<Failure, User>> call(UserCreate userCreate) async {
    return await userRepository.createUser(userCreate);
  }
}
