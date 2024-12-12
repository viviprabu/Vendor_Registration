import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_create.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_update.dart';


abstract interface class GovernorateRepository {
  Future<Either<Failure, Governorate>> getGovernorate(String id);
  Future<Either<Failure, Governorate>> updateGovernorate(GovernorateUpdate governorateUpdate);
  Future<Either<Failure, Governorate>> deleteGovernorate(Governorate governorate);
  Future<Either<Failure, Governorate>> createGovernorate(GovernorateCreate governorateCreate);
  Future<Either<Failure, List<Governorate>>> getGovernorates();
}
