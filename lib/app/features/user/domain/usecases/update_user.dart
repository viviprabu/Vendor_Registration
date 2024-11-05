import 'package:finance_app/app/features/user/domain/entities/user_update.dart';
import 'package:finance_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class UpdateUser {
  final UserRepository userRepository;

  UpdateUser(this.userRepository);

  Future<Either<Failure, User>> call(UserUpdate userUpdate) async {
    return await userRepository.updateUser(userUpdate);
  }
}
