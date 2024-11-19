import 'package:finance_app/app/features/department/data/models/department_modal.dart';

abstract interface class DepartmentRemoteDataSource {
  Future<DepartmentModal> getDepartment(int id);
  Future<DepartmentModal> updateDepartment(DepartmentModal deptModel);
  Future<DepartmentModal> deleteDepartment(DepartmentModal deptModel);
  Future<DepartmentModal> createDepartment(DepartmentModal deptModel);
  Future<List<DepartmentModal>> getDepartments();
}
