import 'package:vendor_registration/app/features/registration/domain/entities/department.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class CreateDepartment {
  final DepartmentRepository departmentRepository;

  CreateDepartment(this.departmentRepository);

  Future<Either<Failure, Department>> call(Department department) async {
    return await departmentRepository.createDepartment(department);
  }
}
