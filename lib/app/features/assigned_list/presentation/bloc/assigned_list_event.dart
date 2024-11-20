import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_create.dart';
import 'package:finance_app/app/features/assigned_list/domain/entities/assigned_list_update.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_request_create.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_request_update.dart';

abstract class AssignedListEvent extends Equatable {
  const AssignedListEvent();

  @override
  List<Object> get props => [];
}

class AssignedListInitialEvent extends AssignedListEvent {}

class AssignedListsListEvent extends AssignedListEvent {}

class AssignedListCreateEvent extends AssignedListEvent {
  final AssignedListCreate assignedListCreate;
  const AssignedListCreateEvent(this.assignedListCreate);

  @override
  List<Object> get props => [assignedListCreate];
}

class AssignedListUpdateEvent extends AssignedListEvent {
  final AssignedListUpdate assignedListUpdate;
  const AssignedListUpdateEvent(this.assignedListUpdate);

  @override
  List<Object> get props => [AssignedListUpdate];
}

class AssignedListDeleteEvent extends AssignedListEvent {
  final AssignedList assignedList;
  const AssignedListDeleteEvent(this.assignedList);

  @override
  List<Object> get props => [assignedList];
}

class AssignedListListEvent extends AssignedListEvent {
  final String id;
  const AssignedListListEvent(this.id);

  @override
  List<Object> get props => [id];
}
