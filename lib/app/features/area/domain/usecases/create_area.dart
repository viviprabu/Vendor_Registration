import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_create.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';


class CreateArea {
  final AreaRepository areaRepository;

  CreateArea(this.areaRepository);

  Future<Either<Failure, Area>> call(AreaCreate areaCreate) async {
    return await areaRepository.createArea(areaCreate);
  }
}
