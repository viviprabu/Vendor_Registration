import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_update.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';


class UpdateArea {
  final AreaRepository areaRepository;

  UpdateArea(this.areaRepository);

  Future<Either<Failure, Area>> call(AreaUpdate areaUpdate) async {
    return await areaRepository.updateArea(areaUpdate);
  }
}
