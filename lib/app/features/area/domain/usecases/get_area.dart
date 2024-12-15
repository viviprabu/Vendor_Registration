import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';

class GetArea {
  final AreaRepository repository;

  GetArea(this.repository);

  Future<Either<Failure, Area>> call(String id) async {
    return await repository.getArea(id);
  }
}
