import 'package:finance_app/app/features/department/data/models/department_create_modal.dart';
import 'package:finance_app/app/features/department/data/models/department_modal.dart';

abstract interface class DepartmentRemoteDataSource {
  Future<DepartmentModal> getDept(String id);
  Future<DepartmentModal> updateDept(DepartmentModal deptModel);
  Future<DepartmentModal> deleteDept(DepartmentModal deptModel);
  Future<DepartmentModal> createDept(DepartmentCreateModal deptModel);
  Future<List<DepartmentModal>> getDepts();
}
