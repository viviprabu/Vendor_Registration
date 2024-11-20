import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_create.dart';
import 'package:finance_app/app/features/initial_request/domain/repositories/initial_request_repository.dart';

class CreateInitialRequest {
  final InitialRequestRepository initialRequestRepository;

  CreateInitialRequest(this.initialRequestRepository);

  Future<Either<Failure, InitialRequest>> call(
      InitialRequestCreate initialRequestCreate) async {
    return await initialRequestRepository
        .createInitialRequest(initialRequestCreate);
  }
}
