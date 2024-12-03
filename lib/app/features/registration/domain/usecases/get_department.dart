import 'package:vendor_registration/app/features/registration/domain/entities/department.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class GetDepartment {
  final DepartmentRepository repository;

  GetDepartment(this.repository);

  Future<Either<Failure, Department>> call(int id) async {
    return await repository.getDepartment(id);
  }
}
