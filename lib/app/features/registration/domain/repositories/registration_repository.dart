import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';

abstract interface class RegistrationRepository {
  Future<Either<Failure, Registration>> getRegistration(int id);
  Future<Either<Failure, Registration>> updateRegistration(
      Registration registration);
  Future<Either<Failure, Registration>> deleteRegistration(
      Registration registration);
  Future<Either<Failure, Registration>> createRegistration(
      Registration registration);
  Future<Either<Failure, List<Registration>>> getRegistrations();
}
