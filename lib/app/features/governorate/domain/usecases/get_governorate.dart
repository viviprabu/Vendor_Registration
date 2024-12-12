import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';

class GetGovernorate {
  final GovernorateRepository repository;

  GetGovernorate(this.repository);

  Future<Either<Failure, Governorate>> call(String id) async {
    return await repository.getGovernorate(id);
  }
}
