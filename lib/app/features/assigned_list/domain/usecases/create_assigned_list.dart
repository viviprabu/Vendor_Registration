import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';
import 'package:finance_app/app/features/assigned_list/domain/repositories/assigned_list_repository.dart';

class CreateAssignedList {
  final AssignedListRepository assignedListRepository;

  CreateAssignedList(this.assignedListRepository);

  Future<Either<Failure, AssignedList>> call(
      AssignedListCreate assignedListCreate) async {
    return await assignedListRepository.createAssignedList(assignedListCreate);
  }
}
