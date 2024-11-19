import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_update.dart';
import 'package:finance_app/app/features/assigned_list/domain/repositories/assigned_list_repository.dart';

class UpdateAssignedList {
  final AssignedListRepository assignedListRepository;

  UpdateAssignedList(this.assignedListRepository);

  Future<Either<Failure, AssignedList>> call(
      AssignedListUpdate assignedListUpdate) async {
    return await assignedListRepository.updateAssignedList(assignedListUpdate);
  }
}
