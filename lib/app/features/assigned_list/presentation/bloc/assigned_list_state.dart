import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_request.dart';

abstract class AssignedListState extends Equatable {
  const AssignedListState();

  @override
  List<Object> get props => [];
}

class AssignedListInitial extends AssignedListState {}

class AssignedListLoadingState extends AssignedListState {}

class AssignedListsListState extends AssignedListState {
  final List<AssignedList> assignedLists;
  const AssignedListsListState(this.assignedLists);

  @override
  List<Object> get props => [assignedLists];
}

class AssignedListCreateState extends AssignedListState {
  final AssignedList assignedList;
  const AssignedListCreateState(this.assignedList);

  @override
  List<Object> get props => [assignedList];
}

class AssignedListUpdateState extends AssignedListState {
  final AssignedList assignedList;
  const AssignedListUpdateState(this.assignedList);

  @override
  List<Object> get props => [assignedList];
}

class AssignedListDeleteState extends AssignedListState {
  final AssignedList assignedList;
  const AssignedListDeleteState(this.assignedList);

  @override
  List<Object> get props => [assignedList];
}

class AssignedListListState extends AssignedListState {
  final AssignedList assignedList;
  const AssignedListListState(this.assignedList);

  @override
  List<Object> get props => [assignedList];
}

class AssignedListError extends AssignedListState {
  final String message;
  const AssignedListError(this.message);

  @override
  List<Object> get props => [message];
}
