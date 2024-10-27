import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/sector/data/datasources/sector_remote_data_source.dart';
import 'package:finance_app/app/features/sector/data/models/sector_create_modal.dart';
import 'package:finance_app/app/features/sector/data/models/sector_modal.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector_create.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';

class SectorRepositoryImpl implements SectorRepository {
  final SectorRemoteDataSource sectorRemoteDataSource;
  SectorRepositoryImpl({required this.sectorRemoteDataSource});

  @override
  Future<Either<Failure, Sector>> createSector(
      SectorCreate sectorCreate) async {
    try {
      final SectorCreateModal sectorCreateModal =
          SectorCreateModal.fromEntity(sectorCreate);
      final SectorModal createdSector =
          await sectorRemoteDataSource.createSector(sectorCreateModal);
      //print(createdUser);
      return Right(createdSector.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, Sector>> getSector(String id) async {
    try {
      final SectorModal sector = await sectorRemoteDataSource.getSector(id);
      return Right(sector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Sector>>> getSectors() async {
    try {
      final List<SectorModal> sectors =
          await sectorRemoteDataSource.getSectors();
      final List<Sector> sectorList =
          sectors.map((sector) => sector.toEntity()).toList();
      return Right(sectorList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Sector>> updateSector(Sector sector) async {
    try {
      final SectorModal updatedSector =
          await sectorRemoteDataSource.updateSector(sector as SectorModal);
      return Right(updatedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Sector>> deleteSector(Sector sector) async {
    try {
      final SectorModal deletedSector =
          await sectorRemoteDataSource.deleteSector(sector as SectorModal);
      return Right(deletedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
