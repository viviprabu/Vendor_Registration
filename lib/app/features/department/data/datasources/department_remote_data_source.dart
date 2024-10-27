import 'package:finance_app/app/features/department/data/models/department_modal.dart';

abstract interface class DepartmentRemoteDataSource {
  Future<DepartmentModal> getDept(String id);
  Future<DepartmentModal> updateDept(DepartmentModal sectorModel);
  Future<DepartmentModal> deleteDept(DepartmentModal sectorModel);
  Future<DepartmentModal> createDept(DepartmentModal sectorModel);
  Future<List<DepartmentModal>> getDepts();
}
