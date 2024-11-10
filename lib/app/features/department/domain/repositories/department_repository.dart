import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';

abstract interface class DepartmentRepository {
  Future<Either<Failure, Department>> getDepartment(int id);
  Future<Either<Failure, Department>> updateDepartment(Department department);
  Future<Either<Failure, Department>> deleteDepartment(Department department);
  Future<Either<Failure, Department>> createDepartment(Department department);
  Future<Either<Failure, List<Department>>> getDepartments();
}
