import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class DeleteDepartment {
  final DepartmentRepository departmentRepository;

  DeleteDepartment(this.departmentRepository);

  Future<Either<Failure, Department>> call(Department department) async {
    return await departmentRepository.deleteDept(department);
  }
}
