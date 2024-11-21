import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/data/datasources/initial_request_remote_data_source.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_create_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_model.dart';
import 'package:finance_app/app/features/initial_request/data/models/initial_request_update_model.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_create.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_update.dart';
import 'package:finance_app/app/features/initial_request/domain/repositories/initial_request_repository.dart';

class InitialRequestRepositoryImpl implements InitialRequestRepository {
  final InitialRequestRemoteDataSource initialRequestRemoteDataSource;
  InitialRequestRepositoryImpl({required this.initialRequestRemoteDataSource});

  @override
  Future<Either<Failure, InitialRequest>> createInitialRequest(
      InitialRequestCreate initialRequestCreate) async {
    try {
      final InitialRequestCreateModal initialRequestCreateModel =
          InitialRequestCreateModal.fromEntity(initialRequestCreate);
      final InitialRequestModal createdInitialRequest =
          await initialRequestRemoteDataSource
              .createInitialRequest(initialRequestCreateModel);
      //print(createdInitialRequest);
      return Right(createdInitialRequest.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, InitialRequest>> deleteInitialRequest(
      InitialRequest initialRequest) async {
    try {
      final InitialRequestModal deletedInitialRequest =
          await initialRequestRemoteDataSource
              .deleteInitialRequest(initialRequest as InitialRequestModal);
      return Right(deletedInitialRequest.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InitialRequest>> getInitialRequest(String id) async {
    try {
      final InitialRequestModal initialRequest =
          await initialRequestRemoteDataSource.getInitialRequest(id);
      return Right(initialRequest.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InitialRequest>>> getInitialRequests() async {
    try {
      final List<InitialRequestModal> initialRequests =
          await initialRequestRemoteDataSource.getInitialRequests();
      final List<InitialRequest> initialRequestsList = initialRequests
          .map((initialRequest) => initialRequest.toEntity())
          .toList();
      return Right(initialRequestsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InitialRequest>> updateInitialRequest(
      InitialRequestUpdate initialRequestUpdate) async {
    try {
      /* final InitialRequestModel updatedInitialRequest =
          await InitialRequestRemoteDataSource.updateInitialRequest(InitialRequest as InitialRequestModel);
      return Right(updatedInitialRequest.toEntity()); */

      final InitialRequestUpdateModal initialRequestUpdateModel =
          InitialRequestUpdateModal.fromEntity(initialRequestUpdate);
      final InitialRequestModal updatedInitialRequest =
          await initialRequestRemoteDataSource
              .updateInitialRequest(initialRequestUpdateModel);
      return Right(updatedInitialRequest.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
