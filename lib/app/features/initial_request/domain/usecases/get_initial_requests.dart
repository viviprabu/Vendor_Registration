import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/repositories/initial_request_repository.dart';

class GetInitialRequests {
  final InitialRequestRepository repository;

  GetInitialRequests(this.repository);

  Future<Either<Failure, List<InitialRequest>>> call() async {
    return await repository.getInitialRequests();
  }
}
