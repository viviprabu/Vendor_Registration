import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/domain/repositories/department_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetDepartments {
  final DepartmentRepository repository;

  GetDepartments(this.repository);

  Future<Either<Failure, List<Department>>> call() async {
    return await repository.getDepts();
  }
}
