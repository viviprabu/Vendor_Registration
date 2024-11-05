part of 'department_bloc.dart';

abstract class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

class DepartmentInitialState extends DepartmentState {}

class DepartmentLoadingState extends DepartmentState {}

class DepartmentCreateState extends DepartmentState {
  final Department department;
  const DepartmentCreateState(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentsListState extends DepartmentState {
  final List<Department> departments;
  const DepartmentsListState(this.departments);

  @override
  List<Object> get props => [departments];
}

class DepartmentUpdateState extends DepartmentState {
  final Department department;
  const DepartmentUpdateState(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentDeleteState extends DepartmentState {
  final Department department;
  const DepartmentDeleteState(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentListState extends DepartmentState {
  final Department department;
  const DepartmentListState(this.department);

  @override
  List<Object> get props => [department];
}

class DepartmentError extends DepartmentState {
  final String message;
  const DepartmentError(this.message);

  @override
  List<Object> get props => [message];
}
