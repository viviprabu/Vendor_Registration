import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_create.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';


class CreateGovernorate {
  final GovernorateRepository governorateRepository;

  CreateGovernorate(this.governorateRepository);

  Future<Either<Failure, Governorate>> call(GovernorateCreate governorateCreate) async {
    return await governorateRepository.createGovernorate(governorateCreate);
  }
}
