import 'package:finance_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class DeleteUser {
  final UserRepository userRepository;

  DeleteUser(this.userRepository);

  Future<Either<Failure, User>> call(User user) async {
    return await userRepository.deleteUser(user);
  }
}
