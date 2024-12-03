import 'package:vendor_registration/app/features/registration/domain/entities/department.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class GetDepartments {
  final DepartmentRepository repository;

  GetDepartments(this.repository);

  Future<Either<Failure, List<Department>>> call() async {
    return await repository.getDepartments();
  }
}
