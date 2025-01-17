import 'package:vendor_registration/app/features/user_role/domain/entities/role_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/system_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/create_user_role.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/get_user_role_functions.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/list_system_functions.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/list_user_roles.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/update_user_role.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/user_role.dart';

part 'user_role_event.dart';
part 'user_role_state.dart';

class UserRoleBloc extends Bloc<UserRoleEvent, UserRoleState> {
  CreateUserRole createUserRole;
  GetUserRoleFunctions getUserRoleFunctions;
  ListSystemFunctions listSystemFunctions;
  ListUserRoles listUserRoles;
  UpdateUserRole updateUserRole;

  UserRoleBloc({
    required this.createUserRole,
    required this.getUserRoleFunctions,
    required this.listSystemFunctions,
    required this.listUserRoles,
    required this.updateUserRole,
  }) : super(UserRoleInitialState()) {
    on<UserRoleInitialEvent>((event, emit) {
      emit(UserRoleInitialState());
    });

    on<UserRoleListEvent>((event, emit) async {
      emit(UserRoleLoading());
      final failureOrUserRole = await getUserRoleFunctions(event.id);
      failureOrUserRole.fold(
        (failure) => emit(UserRoleError(failure.toString())),
        (userRoleFunctions) => emit(UserRoleList(userRoleFunctions)),
      );
    });

    on<UserRolesListEvent>((event, emit) async {
      emit(UserRoleLoading());
      final failureOrUserRoles = await listUserRoles();
      failureOrUserRoles.fold(
        (failure) => emit(UserRoleError(failure.toString())),
        (userRoles) => emit(UserRolesList(userRoles)),
      );
    });

    on<UserRoleCreateEvent>((event, emit) async {
      emit(UserRoleLoading());
      final failureOrUserRoles = await createUserRole(event.userRole);
      failureOrUserRoles.fold(
        (failure) => emit(UserRoleError(failure.toString())),
        (userRole) => emit(UserRoleCreate(userRole)),
      );
    });

    on<UserRoleUpdateEvent>((event, emit) async {
      emit(UserRoleLoading());
      final failureOrUserRoles = await updateUserRole(event.userRole);
      failureOrUserRoles.fold(
        (failure) => emit(UserRoleError(failure.toString())),
        (userRole) => emit(UserRoleUpdate(userRole)),
      );
    });

    on<SystemFunctionsEvent>((event, emit) async {
      emit(UserRoleLoading());
      final failureOrSystemFunctions = await listSystemFunctions();
      failureOrSystemFunctions.fold(
        (failure) => emit(UserRoleError(failure.toString())),
        (systemFunctions) => emit(SystemFunctionList(systemFunctions)),
      );
    });
  }
}
