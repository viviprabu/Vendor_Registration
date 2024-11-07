import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetDepartment {
  final DepartmentRepository repository;

  GetDepartment(this.repository);

  Future<Either<Failure, Department>> call(int id) async {
    return await repository.getDepartment(id);
  }
}
