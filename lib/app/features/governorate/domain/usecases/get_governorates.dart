import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';

class GetGovernorates {
  final GovernorateRepository repository;

  GetGovernorates(this.repository);

  Future<Either<Failure, List<Governorate>>> call() async {
    return await repository.getGovernorates();
  }
}
