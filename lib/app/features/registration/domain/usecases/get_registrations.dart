import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class GetRegistrations {
  final RegistrationRepository repository;

  GetRegistrations(this.repository);

  Future<Either<Failure, List<Registration>>> call() async {
    return await repository.getRegistrations();
  }
}
