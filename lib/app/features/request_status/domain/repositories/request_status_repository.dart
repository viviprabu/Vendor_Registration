import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/request_status/domain/entities/request_status.dart';

abstract interface class RequestStatusRepository {
  Future<Either<Failure, RequestStatus>> getRequestStatus(int id);
  Future<Either<Failure, RequestStatus>> updateRequestStatus(
      RequestStatus requestStatus);
  Future<Either<Failure, RequestStatus>> deleteRequestStatus(
      RequestStatus requestStatus);
  Future<Either<Failure, RequestStatus>> createRequestStatus(
      RequestStatus requestStatus);
  Future<Either<Failure, List<RequestStatus>>> listRequestStatuses();
}
