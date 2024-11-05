import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/department/data/datasources/department_remote_data_source.dart';
import 'package:finance_app/app/features/department/data/models/department_modal.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/domain/repositories/department_repository.dart';

class DepartmentRepositoryImpl implements DepartmentRepository {
  final DepartmentRemoteDataSource departmentRemoteDataSource;
  DepartmentRepositoryImpl({required this.departmentRemoteDataSource});

  @override
  Future<Either<Failure, Department>> getDepartment(String id) async {
    try {
      final DepartmentModal sector =
          await departmentRemoteDataSource.getDepartment(id);
      return Right(sector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Department>>> getDepartments() async {
    try {
      final List<DepartmentModal> department =
          await departmentRemoteDataSource.getDepartments();
      final List<Department> deptList =
          department.map((dept) => dept.toEntity()).toList();
      return Right(deptList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Department>> updateDepartment(
      Department department) async {
    try {
      final DepartmentModal updatedSector = await departmentRemoteDataSource
          .updateDepartment(department as DepartmentModal);
      return Right(updatedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Department>> deleteDepartment(
      Department department) async {
    try {
      final DepartmentModal deletedSector = await departmentRemoteDataSource
          .deleteDepartment(department as DepartmentModal);
      return Right(deletedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Department>> createDepartment(
      Department department) async {
    try {
      final DepartmentModal departmentModal =
          DepartmentModal.fromEntity(department);
      final DepartmentModal createdSector =
          await departmentRemoteDataSource.createDepartment(departmentModal);
      return Right(createdSector.toEntity());
    } catch (e) {
      final ServerFailure serverFailure = ServerFailure(e.toString());
      return Left(serverFailure);
    }
  }
}
