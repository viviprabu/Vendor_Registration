import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/request_status/domain/entities/request_status.dart';
import 'package:finance_app/app/features/request_status/domain/repositories/request_status_repository.dart';

class ListRequestStatuses {
  final RequestStatusRepository requestStatusRepository;

  ListRequestStatuses(this.requestStatusRepository);

  Future<Either<Failure, List<RequestStatus>>> call() async {
    return requestStatusRepository.listRequestStatuses();
  }
}
