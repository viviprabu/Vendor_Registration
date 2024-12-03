import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/registration/domain/entities/department.dart';

abstract interface class DepartmentRepository {
  Future<Either<Failure, Department>> getDepartment(int id);
  Future<Either<Failure, Department>> updateDepartment(Department department);
  Future<Either<Failure, Department>> deleteDepartment(Department department);
  Future<Either<Failure, Department>> createDepartment(Department department);
  Future<Either<Failure, List<Department>>> getDepartments();
}
