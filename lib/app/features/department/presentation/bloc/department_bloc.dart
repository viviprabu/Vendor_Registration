import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/department/domain/entities/department.dart';
import 'package:finance_app/app/features/department/domain/usecases/add_department.dart';
import 'package:finance_app/app/features/department/domain/usecases/delete_department.dart';
import 'package:finance_app/app/features/department/domain/usecases/get_department.dart';
import 'package:finance_app/app/features/department/domain/usecases/get_departments.dart';
import 'package:finance_app/app/features/department/domain/usecases/update_department.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  GetDepartment getDepartment;
  CreateDepartment createDepartment;
  DeleteDepartment deleteDepartment;
  GetDepartments getDepartments;
  UpdateDepartment updateDepartment;

  DepartmentBloc({
    required this.getDepartment,
    required this.createDepartment,
    required this.deleteDepartment,
    required this.getDepartments,
    required this.updateDepartment,
  }) : super(DepartmentInitialState()) {
    on<DepartmentListEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      final failureOrSector = await getDepartment(event.id);
      failureOrSector.fold(
        (failure) => emit(DepartmentError(failure.toString())),
        (sector) => emit(DepartmentListState(sector)),
      );
    });

    on<DepartmentsListEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      final failureOrDepartments = await getDepartments();
      failureOrDepartments.fold(
        (failure) => emit(DepartmentError(failure.toString())),
        (departments) => emit(DepartmentsListState(departments)),
      );
    });

    on<DepartmentCreateEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      final failureOrDepartments = await createDepartment(event.department);
      failureOrDepartments.fold(
        (failure) => emit(DepartmentError(failure.toString())),
        (department) => emit(DepartmentCreateState(department)),
      );
    });

    on<DepartmentUpdateEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      final failureOrDepartment = await updateDepartment(event.department);
      failureOrDepartment.fold(
        (failure) => emit(DepartmentError(failure.toString())),
        (department) => emit(DepartmentUpdateState(department)),
      );
    });

    on<DepartmentDeleteEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      final failureOrDepartment = await deleteDepartment(event.department);
      failureOrDepartment.fold(
        (failure) => emit(DepartmentError(failure.toString())),
        (sector) => emit(DepartmentDeleteState(sector)),
      );
    });
  }
}
