import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';
import 'package:finance_app/app/features/assigned_list/domain/usecases/create_assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/usecases/delete_assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/usecases/get_assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/usecases/get_assigned_lists.dart';
import 'package:finance_app/app/features/assigned_list/domain/usecases/update_assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/presentation/bloc/assigned_list_event.dart';
import 'package:finance_app/app/features/assigned_list/presentation/bloc/assigned_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignedListBloc extends Bloc<AssignedListEvent, AssignedListState> {
  GetAssignedList getAssignedList;
  GetAssignedLists getAssignedLists;
  CreateAssignedList createAssignedList;
  UpdateAssignedList updateAssignedList;
  DeleteAssignedList deleteAssignedList;

  AssignedListBloc({
    required this.getAssignedList,
    required this.getAssignedLists,
    required this.createAssignedList,
    required this.updateAssignedList,
    required this.deleteAssignedList,
  }) : super(AssignedListInitial()) {
    on<AssignedListListEvent>((event, emit) async {
      emit(AssignedListLoadingState());
      final failureOrAssignedList = await getAssignedList(event.id);
      failureOrAssignedList.fold(
        (failure) => emit(AssignedListError(failure.toString())),
        (assignedList) => emit(AssignedListListState(assignedList)),
      );
    });

    on<AssignedListsListEvent>((event, emit) async {
      emit(AssignedListLoadingState());
      final failureOrAssignedLists = await getAssignedLists();
      failureOrAssignedLists.fold(
        (failure) => emit(AssignedListError(failure.toString())),
        (assignedLists) => emit(AssignedListsListState(assignedLists)),
      );
    });

    on<AssignedListCreateEvent>((event, emit) async {
      emit(AssignedListLoadingState());
      final failureOrAssignedList =
          await createAssignedList(event.assignedListCreate);
      failureOrAssignedList.fold(
        (failure) => emit(AssignedListError(failure.toString())),
        (assignedList) => emit(AssignedListCreateState(assignedList)),
      );
    });

    on<AssignedListUpdateEvent>((event, emit) async {
      emit(AssignedListLoadingState());
      final failureOrAssignedList =
          await updateAssignedList(event.assignedListUpdate);
      failureOrAssignedList.fold(
        (failure) => emit(AssignedListError(failure.toString())),
        (assignedList) => emit(AssignedListUpdateState(assignedList)),
      );
    });

    on<AssignedListDeleteEvent>((event, emit) async {
      emit(AssignedListLoadingState());
      final failureOrAssignedList =
          await deleteAssignedList(event.assignedList);
      failureOrAssignedList.fold(
        (failure) => emit(AssignedListError(failure.toString())),
        (assignedList) => emit(AssignedListDeleteState(assignedList)),
      );
    });

    on<AssignedListInitialEvent>((event, emit) {
      emit(AssignedListInitial());
    });
  }
}
