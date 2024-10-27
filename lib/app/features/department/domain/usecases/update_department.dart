import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class UpdateSector {
  final SectorRepository userRepository;

  UpdateSector(this.userRepository);

  Future<Either<Failure, Sector>> call(Sector sector) async {
    return await userRepository.updateSector(sector);
  }
}
