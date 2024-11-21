import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/repositories/initial_request_repository.dart';

class GetInitialRequest {
  final InitialRequestRepository repository;

  GetInitialRequest(this.repository);

  Future<Either<Failure, InitialRequest>> call(String id) async {
    return await repository.getInitialRequest(id);
  }
}
