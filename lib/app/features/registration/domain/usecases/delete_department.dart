import 'package:vendor_registration/app/features/registration/domain/entities/department.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';

class DeleteDepartment {
  final DepartmentRepository departmentRepository;

  DeleteDepartment(this.departmentRepository);

  Future<Either<Failure, Department>> call(Department department) async {
    return await departmentRepository.deleteDepartment(department);
  }
}
