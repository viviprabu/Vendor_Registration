import 'package:finance_app/app/features/initial_request/data/models/initial_request_create_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_update_model.dart';

abstract interface class InitialRequestRemoteDataSource {
  Future<InitialRequestModal> getInitialRequest(String id);
  Future<InitialRequestModal> updateInitialRequest(
      InitialRequestUpdateModal initialRequestUpdateModel);
  Future<InitialRequestModal> deleteInitialRequest(
      InitialRequestModal initialRequestModel);
  Future<InitialRequestModal> createInitialRequest(
      InitialRequestCreateModal initialRequestCreateModel);
  Future<List<InitialRequestModal>> getInitialRequests();
}
