import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/registration_remote_data_source.dart';
import 'package:vendor_registration/app/features/registration/data/models/registration_modal.dart';
import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final RegistrationRemoteDataSource registrationRemoteDataSource;
  RegistrationRepositoryImpl({required this.registrationRemoteDataSource});

  @override
  Future<Either<Failure, Registration>> getRegistration(int id) async {
    try {
      final RegistrationModal registration =
          await registrationRemoteDataSource.getRegistration(id);
      return Right(registration.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Registration>>> getRegistrations() async {
    try {
      final List<RegistrationModal> registration =
          await registrationRemoteDataSource.getRegistrations();
      final List<Registration> registrationList =
          registration.map((dept) => dept.toEntity()).toList();
      return Right(registrationList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Registration>> updateRegistration(
      Registration registration) async {
    try {
      final RegistrationModal updatedregistration =
          await registrationRemoteDataSource
              .updateRegistration(registration as RegistrationModal);
      return Right(updatedregistration.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Registration>> deleteRegistration(
      Registration registration) async {
    try {
      final RegistrationModal deletedRegistration =
          await registrationRemoteDataSource
              .deleteRegistration(registration as RegistrationModal);
      return Right(deletedRegistration.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Registration>> createRegistration(
      Registration registration) async {
    try {
      final RegistrationModal registrationModal =
          RegistrationModal.fromEntity(registration);
      final RegistrationModal createdRegistration =
          await registrationRemoteDataSource
              .createRegistration(registrationModal);
      return Right(createdRegistration.toEntity());
    } catch (e) {
      final ServerFailure serverFailure = ServerFailure(e.toString());
      return Left(serverFailure);
    }
  }
}
