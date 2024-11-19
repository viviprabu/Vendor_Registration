import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/repositories/assigned_list_repository.dart';

class DeleteAssignedList {
  final AssignedListRepository assignedListRepository;

  DeleteAssignedList(this.assignedListRepository);

  Future<Either<Failure, AssignedList>> call(AssignedList assignedList) async {
    return await assignedListRepository.deleteAssignedList(assignedList);
  }
}
