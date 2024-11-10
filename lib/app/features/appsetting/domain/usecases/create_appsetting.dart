import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class CreateSector {
  final SectorRepository sectorRepository;

  CreateSector(this.sectorRepository);

  Future<Either<Failure, Sector>> call(Sector sector) async {
    return await sectorRepository.createSector(sector);
  }
}
