import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_update.dart';

abstract interface class AssignedListRepository {
  Future<Either<Failure, AssignedList>> getAssignedList(String id);
  Future<Either<Failure, AssignedList>> updateAssignedList(
      AssignedListUpdate assignedListUpdate);
  Future<Either<Failure, AssignedList>> deleteAssignedList(
      AssignedList assignedList);
  Future<Either<Failure, AssignedList>> createAssignedList(
      AssignedListCreate assignedListCreate);
  Future<Either<Failure, List<AssignedList>>> getAssignedLists();
}
