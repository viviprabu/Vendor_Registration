import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';

abstract interface class DepartmentRepository {
  Future<Either<Failure, Department>> getDept(String id);
  Future<Either<Failure, Department>> updateDept(Department department);
  Future<Either<Failure, Department>> deleteDept(Department department);
  Future<Either<Failure, Department>> createDept(Department department);
  Future<Either<Failure, List<Department>>> getDepts();
}
