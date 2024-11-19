import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/repositories/assigned_list_repository.dart';

class GetAssignedList {
  final AssignedListRepository repository;

  GetAssignedList(this.repository);

  Future<Either<Failure, AssignedList>> call(String id) async {
    return await repository.getAssignedList(id);
  }
}
