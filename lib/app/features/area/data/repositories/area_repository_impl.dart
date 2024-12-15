import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/data/datasources/area_remote_data_source.dart';
import 'package:vendor_registration/app/features/area/data/models/area_create_model.dart';
import 'package:vendor_registration/app/features/area/data/models/area_model.dart';
import 'package:vendor_registration/app/features/area/data/models/area_update_model.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_create.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_update.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';


class AreaRepositoryImpl implements AreaRepository {
  final AreaRemoteDataSource areaRemoteDataSource;
  AreaRepositoryImpl({required this.areaRemoteDataSource});

  @override
  Future<Either<Failure, Area>> createArea(AreaCreate areaCreate) async {
    try {
      final AreaCreateModel areaCreateModel =
          AreaCreateModel.fromEntity(areaCreate);
      final AreaModel createdArea =
          await areaRemoteDataSource.createArea(areaCreateModel);
      //print(createdArea);
      return Right(createdArea.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, Area>> deleteArea(Area area) async {
    try {
      final AreaModel deletedArea =
          await areaRemoteDataSource.deleteArea(area as AreaModel);
      return Right(deletedArea.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Area>> getArea(String id) async {
    try {
      final AreaModel area = await areaRemoteDataSource.getArea(id);
      return Right(area.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Area>>> getAreas() async {
    try {
      final List<AreaModel> areas = await areaRemoteDataSource.getAreas();
      final List<Area> areasList =
          areas.map((area) => area.toEntity()).toList();
      return Right(areasList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Area>> updateArea(AreaUpdate areaUpdate) async {
    try {
      /* final AreaModel updatedArea =
          await AreaRemoteDataSource.updateArea(Area as AreaModel);
      return Right(updatedArea.toEntity()); */

      final AreaUpdateModel areaUpdateModel =
          AreaUpdateModel.fromEntity(areaUpdate);
      final AreaModel updatedArea =
          await areaRemoteDataSource.updateArea(areaUpdateModel);
      return Right(updatedArea.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
