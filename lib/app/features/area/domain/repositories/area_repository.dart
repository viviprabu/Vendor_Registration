import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_create.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_update.dart';



abstract interface class AreaRepository {
  Future<Either<Failure, Area>> getArea(String id);
  Future<Either<Failure, Area>> updateArea(AreaUpdate areaUpdate);
  Future<Either<Failure, Area>> deleteArea(Area area);
  Future<Either<Failure, Area>> createArea(AreaCreate areaCreate);
  Future<Either<Failure, List<Area>>> getAreas();
}
