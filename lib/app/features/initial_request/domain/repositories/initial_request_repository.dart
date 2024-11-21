import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_create.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_update.dart';

abstract interface class InitialRequestRepository {
  Future<Either<Failure, InitialRequest>> getInitialRequest(String id);
  Future<Either<Failure, InitialRequest>> updateInitialRequest(
      InitialRequestUpdate initialRequestUpdate);
  Future<Either<Failure, InitialRequest>> deleteInitialRequest(
      InitialRequest initialRequest);
  Future<Either<Failure, InitialRequest>> createInitialRequest(
      InitialRequestCreate initialRequestCreate);
  Future<Either<Failure, List<InitialRequest>>> getInitialRequests();
}
