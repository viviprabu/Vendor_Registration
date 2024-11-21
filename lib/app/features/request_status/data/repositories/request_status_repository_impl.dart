import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/request_status/data/datasources/request_status_remote_data_source.dart';
import 'package:finance_app/app/features/request_status/data/models/request_status_model.dart';
import 'package:finance_app/app/features/request_status/domain/entities/request_status.dart';
import 'package:finance_app/app/features/request_status/domain/repositories/request_status_repository.dart';

class RequestStatusRepositoryImpl implements RequestStatusRepository {
  final RequestStatusRemoteDataSource requestStatusRemoteDataSource;

  RequestStatusRepositoryImpl({required this.requestStatusRemoteDataSource});

  @override
  Future<Either<Failure, RequestStatus>> createRequestStatus(
      RequestStatus requestStatus) async {
    try {
      final RequestStatusModel requestStatusModel =
          RequestStatusModel.fromEntity(requestStatus);
      final RequestStatusModel createdRequestStatus =
          await requestStatusRemoteDataSource
              .createRequestStatus(requestStatusModel);

      return Right(createdRequestStatus.toEntity());
    } catch (e) {
      final ServerFailure serverFailure = ServerFailure(e.toString());
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, RequestStatus>> deleteRequestStatus(
      RequestStatus requestStatus) async {
    try {
      final RequestStatusModel requestStatusModel =
          RequestStatusModel.fromEntity(requestStatus);
      final RequestStatusModel deletedRequestStatus =
          await requestStatusRemoteDataSource
              .deleteRequestStatus(requestStatusModel);
      return Right(deletedRequestStatus.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestStatus>> getRequestStatus(int id) async {
    try {
      final RequestStatusModel requestStatusModel =
          await requestStatusRemoteDataSource.getRequestStatus(id);
      return Right(requestStatusModel.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RequestStatus>>> listRequestStatuses() async {
    try {
      final List<RequestStatusModel> requestStatuses =
          await requestStatusRemoteDataSource.listRequestStatuses();
      final List<RequestStatus> requestStatusList = requestStatuses
          .map((requestStatus) => requestStatus.toEntity())
          .toList();
      return Right(requestStatusList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RequestStatus>> updateRequestStatus(
      RequestStatus requestStatus) async {
    try {
      final RequestStatusModel requestStatusModel =
          RequestStatusModel.fromEntity(requestStatus);
      final RequestStatusModel updatedRequestStatus =
          await requestStatusRemoteDataSource
              .updateRequestStatus(requestStatusModel);
      return Right(updatedRequestStatus.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
