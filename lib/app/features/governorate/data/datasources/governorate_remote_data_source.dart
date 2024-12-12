


import 'package:vendor_registration/app/features/governorate/data/models/governorate_create_model.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_model.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_update_model.dart';

abstract interface class GovernorateRemoteDataSource {
  Future<GovernorateModel> getGovernorate(String id);
  Future<GovernorateModel> updateGovernorate(GovernorateUpdateModel governorateUpdateModel);
  Future<GovernorateModel> deleteGovernorate(GovernorateModel governorateModel);
  Future<GovernorateModel> createGovernorate(GovernorateCreateModel governorateCreateModel);
  Future<List<GovernorateModel>> getGovernorates();
}
