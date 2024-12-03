import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class GetRegistration {
  final RegistrationRepository repository;

  GetRegistration(this.repository);

  Future<Either<Failure, Registration>> call(int id) async {
    return await repository.getRegistration(id);
  }
}
