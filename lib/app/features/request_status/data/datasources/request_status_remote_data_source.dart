import 'package:finance_app/app/features/request_status/data/models/request_status_model.dart';

abstract interface class RequestStatusRemoteDataSource {
  Future<RequestStatusModel> getRequestStatus(int id);
  Future<RequestStatusModel> updateRequestStatus(
      RequestStatusModel requestStatusModel);
  Future<RequestStatusModel> deleteRequestStatus(
      RequestStatusModel requestStatusModel);
  Future<RequestStatusModel> createRequestStatus(
      RequestStatusModel requestStatusModel);
  Future<List<RequestStatusModel>> listRequestStatuses();
}
