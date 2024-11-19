import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_create_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_model.dart';
import 'package:finance_app/app/features/assigned_list/data/models/assigned_list_update_model.dart';

abstract interface class AssignedListRemoteDataSource {
  Future<AssignedListModal> getAssignedList(String id);
  Future<AssignedListModal> updateAssignedList(
      AssignedListUpdateModal assignedListUpdateModel);
  Future<AssignedListModal> deleteAssignedList(
      AssignedListModal assignedListModel);
  Future<AssignedListModal> createAssignedList(
      AssignedListCreateModal assignedListCreateModel);
  Future<List<AssignedListModal>> getAssignedLists();
}
