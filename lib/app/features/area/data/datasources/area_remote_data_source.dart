


import 'package:vendor_registration/app/features/area/data/models/area_create_model.dart';
import 'package:vendor_registration/app/features/area/data/models/area_model.dart';
import 'package:vendor_registration/app/features/area/data/models/area_update_model.dart';

abstract interface class AreaRemoteDataSource {
  Future<AreaModel> getArea(String id);
  Future<AreaModel> updateArea(AreaUpdateModel areaUpdateModel);
  Future<AreaModel> deleteArea(AreaModel areaModel);
  Future<AreaModel> createArea(AreaCreateModel aAreaCreateModel);
  Future<List<AreaModel>> getAreas();
}
