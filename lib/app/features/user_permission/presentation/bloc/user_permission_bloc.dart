import 'package:finance_app/app/features/user_permission/domain/usecases/get_user_role_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/user_permission/domain/entities/role_function.dart';

part 'user_permission_event.dart';
part 'user_permission_state.dart';

class UserPermissionBloc
    extends Bloc<UserPermissionEvent, UserPermissionState> {
  GetUserRoleFunctions getUserRoleFunctions;

  UserPermissionBloc({
    required this.getUserRoleFunctions,
  }) : super(UserPermissionInitial()) {
    on<UserPermissionInitialEvent>((event, emit) {
      emit(UserPermissionInitial());
    });

    on<GetUserPermissions>((event, emit) async {
      emit(UserPermissionLoading());
      final failureOrUserRole = await getUserRoleFunctions(event.roleId);
      failureOrUserRole.fold(
        (failure) => emit(UserPermissionError(failure.toString())),
        (roleFunctions) => emit(UserPermissionLoaded(roleFunctions)),
      );
    });
  }
}
