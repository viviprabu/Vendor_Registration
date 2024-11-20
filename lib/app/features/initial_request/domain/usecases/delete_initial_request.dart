import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/repositories/initial_request_repository.dart';

class DeleteInitialRequest {
  final InitialRequestRepository initialRequestRepository;

  DeleteInitialRequest(this.initialRequestRepository);

  Future<Either<Failure, InitialRequest>> call(
      InitialRequest initialRequest) async {
    return await initialRequestRepository.deleteInitialRequest(initialRequest);
  }
}
