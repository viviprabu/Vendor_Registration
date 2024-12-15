import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';

class GetAreas {
  final AreaRepository repository;

  GetAreas(this.repository);

  Future<Either<Failure, List<Area>>> call() async {
    return await repository.getAreas();
  }
}
