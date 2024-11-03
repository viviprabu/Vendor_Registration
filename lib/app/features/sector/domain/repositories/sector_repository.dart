import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';

abstract interface class SectorRepository {
  Future<Either<Failure, Sector>> getSector(int id);
  Future<Either<Failure, Sector>> updateSector(Sector sector);
  Future<Either<Failure, Sector>> deleteSector(Sector sector);
  Future<Either<Failure, Sector>> createSector(Sector sector);
  Future<Either<Failure, List<Sector>>> getSectors();
}
