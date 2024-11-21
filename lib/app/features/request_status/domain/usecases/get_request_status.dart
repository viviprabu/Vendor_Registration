import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/request_status/domain/entities/request_status.dart';
import 'package:finance_app/app/features/request_status/domain/repositories/request_status_repository.dart';

class GetRequestStatus {
  final RequestStatusRepository requestStatusRepository;

  GetRequestStatus(this.requestStatusRepository);

  Future<Either<Failure, RequestStatus>> call(int id) async {
    return requestStatusRepository.getRequestStatus(id);
  }
}
