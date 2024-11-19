import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/repositories/assigned_list_repository.dart';

class GetAssignedLists {
  final AssignedListRepository repository;

  GetAssignedLists(this.repository);

  Future<Either<Failure, List<AssignedList>>> call() async {
    return await repository.getAssignedLists();
  }
}
