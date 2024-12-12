import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_update.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';


class UpdateGovernorate {
  final GovernorateRepository governorateRepository;

  UpdateGovernorate(this.governorateRepository);

  Future<Either<Failure, Governorate>> call(GovernorateUpdate governorateUpdate) async {
    return await governorateRepository.updateGovernorate(governorateUpdate);
  }
}
