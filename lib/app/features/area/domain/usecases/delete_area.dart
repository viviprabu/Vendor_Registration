
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';


class DeleteArea {
  final AreaRepository areaRepository;

  DeleteArea(this.areaRepository);

  Future<Either<Failure, Area>> call(Area area) async {
    return await areaRepository.deleteArea(area);
  }
}
