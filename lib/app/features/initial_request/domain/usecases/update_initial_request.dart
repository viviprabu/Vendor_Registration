import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_update.dart';
import 'package:finance_app/app/features/initial_request/domain/repositories/initial_request_repository.dart';

class UpdateInitialRequest {
  final InitialRequestRepository initialRequestRepository;

  UpdateInitialRequest(this.initialRequestRepository);

  Future<Either<Failure, InitialRequest>> call(
      InitialRequestUpdate initialRequestUpdate) async {
    return await initialRequestRepository
        .updateInitialRequest(initialRequestUpdate);
  }
}
