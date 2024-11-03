import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetSectors {
  final SectorRepository repository;

  GetSectors(this.repository);

  Future<Either<Failure, List<Sector>>> call() async {
    return await repository.getSectors();
  }
}
