part of 'department_bloc.dart';

abstract class DepartmentEvent extends Equatable {
  const DepartmentEvent();

  @override
  List<Object> get props => [];
}

class DepartmentInitialEvent extends DepartmentEvent {}

class DepartmentsListEvent extends DepartmentEvent {}

class DepartmentCreateEvent extends DepartmentEvent {
  final Department department;
  const DepartmentCreateEvent(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentUpdateEvent extends DepartmentEvent {
  final Department department;
  const DepartmentUpdateEvent(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentDeleteEvent extends DepartmentEvent {
  final Department department;
  const DepartmentDeleteEvent(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentListEvent extends DepartmentEvent {
  final int id;
  const DepartmentListEvent(this.id);

  @override
  List<Object> get props => [id];
}
