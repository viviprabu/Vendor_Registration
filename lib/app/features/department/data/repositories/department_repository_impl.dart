import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/department/data/datasources/department_remote_data_source.dart';
import 'package:finance_app/app/features/department/data/models/department_create_modal.dart';
import 'package:finance_app/app/features/department/data/models/department_modal.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/domain/entities/department_create.dart';
import 'package:finance_app/app/features/department/domain/repositories/department_repository.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  final DepartmentRemoteDataSource departmentRemoteDataSource;
  DepartmentRepositoryImpl({required this.departmentRemoteDataSource});

  @override
  Future<Either<Failure, Department>> createdDept(
      DepartmentCreate deptCreate) async {
    try {
      final DepartmentCreateModal departmentCreateModal =
          DepartmentCreateModal.fromEntity(deptCreate);
      final DepartmentModal createdDept =
          await departmentRemoteDataSource.createDept(departmentCreateModal);
      //print(createdUser);
      return Right(createdDept.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, Department>> getDept(String id) async {
    try {
      final DepartmentModal sector =
          await departmentRemoteDataSource.getDept(id);
      return Right(sector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Department>>> getDepts() async {
    try {
      final List<DepartmentModal> department =
          await departmentRemoteDataSource.getDepts();
      final List<Department> deptList =
          department.map((dept) => dept.toEntity()).toList();
      return Right(deptList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Department>> updateDept(Department department) async {
    try {
      final DepartmentModal updatedSector = await departmentRemoteDataSource
          .updateDept(department as DepartmentModal);
      return Right(updatedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Department>> deleteDept(Department department) async {
    try {
      final DepartmentModal deletedSector = await departmentRemoteDataSource
          .deleteDept(department as DepartmentModal);
      return Right(deletedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Department>> createDept(Department department) {
    // TODO: implement createDept
    throw UnimplementedError();
  }
}
