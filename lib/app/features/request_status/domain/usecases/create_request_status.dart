import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/request_status/domain/entities/request_status.dart';
import 'package:finance_app/app/features/request_status/domain/repositories/request_status_repository.dart';

class CreateRequestStatus {
  final RequestStatusRepository requestStatusRepository;

  CreateRequestStatus(this.requestStatusRepository);

  Future<Either<Failure, RequestStatus>> call(
      RequestStatus requestStatus) async {
    return requestStatusRepository.createRequestStatus(requestStatus);
  }
}
