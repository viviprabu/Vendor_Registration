import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/registration_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class DeleteRegistration {
  final RegistrationRepository registrationRepository;

  DeleteRegistration(this.registrationRepository);

  Future<Either<Failure, Registration>> call(Registration registration) async {
    return await registrationRepository.deleteRegistration(registration);
  }
}
