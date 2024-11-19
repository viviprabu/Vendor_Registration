import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/assigned_list/data/datasources/assigned_list_remote_data_source.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_create_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_update_model.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_update.dart';
import 'package:finance_app/app/features/assigned_list/domain/repositories/assigned_list_repository.dart';

class AssignedListRepositoryImpl implements AssignedListRepository {
  final AssignedListRemoteDataSource assignedListRemoteDataSource;
  AssignedListRepositoryImpl({required this.assignedListRemoteDataSource});

  @override
  Future<Either<Failure, AssignedList>> createAssignedList(
      AssignedListCreate assignedListCreate) async {
    try {
      final AssignedListCreateModal assignedListCreateModel =
          AssignedListCreateModal.fromEntity(assignedListCreate);
      final AssignedListModal createdAssignedList =
          await assignedListRemoteDataSource
              .createAssignedList(assignedListCreateModel);
      //print(createdAssignedList);
      return Right(createdAssignedList.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, AssignedList>> deleteAssignedList(
      AssignedList assignedList) async {
    try {
      final AssignedListModal deletedAssignedList =
          await assignedListRemoteDataSource
              .deleteAssignedList(assignedList as AssignedListModal);
      return Right(deletedAssignedList.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssignedList>> getAssignedList(String id) async {
    try {
      final AssignedListModal assignedList =
          await assignedListRemoteDataSource.getAssignedList(id);
      return Right(assignedList.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AssignedList>>> getAssignedLists() async {
    try {
      final List<AssignedListModal> assignedLists =
          await assignedListRemoteDataSource.getAssignedLists();
      final List<AssignedList> assignedListsList =
          assignedLists.map((assignedList) => assignedList.toEntity()).toList();
      return Right(assignedListsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssignedList>> updateAssignedList(
      AssignedListUpdate assignedListUpdate) async {
    try {
      /* final AssignedListModel updatedAssignedList =
          await AssignedListRemoteDataSource.updateAssignedList(AssignedList as AssignedListModel);
      return Right(updatedAssignedList.toEntity()); */

      final AssignedListUpdateModal assignedListUpdateModel =
          AssignedListUpdateModal.fromEntity(assignedListUpdate);
      final AssignedListModal updatedAssignedList =
          await assignedListRemoteDataSource
              .updateAssignedList(assignedListUpdateModel);
      return Right(updatedAssignedList.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
