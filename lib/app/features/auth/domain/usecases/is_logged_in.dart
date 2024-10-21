import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';

class IsLoggedIn {
  final AuthRepository authRepository;

  IsLoggedIn(this.authRepository);

  Future<bool> call() async {
    return await authRepository.isLoggedIn();
  }
}
