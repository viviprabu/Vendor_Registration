
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';

class DeleteGovernorate {
  final GovernorateRepository governorateRepository;

  DeleteGovernorate(this.governorateRepository);

  Future<Either<Failure, Governorate>> call(Governorate governorate) async {
    return await governorateRepository.deleteGovernorate(governorate);
  }
}
