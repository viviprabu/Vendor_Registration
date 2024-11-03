import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetSector {
  final SectorRepository repository;

  GetSector(this.repository);

  Future<Either<Failure, Sector>> call(String id) async {
    return await repository.getSector(id);
  }
}
