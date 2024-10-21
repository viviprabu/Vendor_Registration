import 'package:finance_app/app/features/user/domain/entities/user.dart';
import 'package:finance_app/app/features/user/domain/entities/user_create.dart';
import 'package:finance_app/app/features/user/domain/usecases/create_user.dart';
import 'package:finance_app/app/features/user/domain/usecases/delete_user.dart';
import 'package:finance_app/app/features/user/domain/usecases/get_user.dart';
import 'package:finance_app/app/features/user/domain/usecases/get_users.dart';
import 'package:finance_app/app/features/user/domain/usecases/update_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  GetUser getUser;
  GetUsers getUsers;
  CreateUser createUser;
  UpdateUser updateUser;
  DeleteUser deleteUser;

  UserBloc({
    required this.getUser,
    required this.getUsers,
    required this.createUser,
    required this.updateUser,
    required this.deleteUser,
  }) : super(UserInitial()) {
    on<UserListEvent>((event, emit) async {
      emit(UserLoading());
      final failureOrUser = await getUser(event.id);
      failureOrUser.fold(
        (failure) => emit(UserError(failure.toString())),
        (user) => emit(UserListState(user)),
      );
    });

    on<UsersListEvent>((event, emit) async {
      emit(UserLoading());
      final failureOrUsers = await getUsers();
      failureOrUsers.fold(
        (failure) => emit(UserError(failure.toString())),
        (users) => emit(UsersListState(users)),
      );
    });

    on<UserCreateEvent>((event, emit) async {
      emit(UserLoading());
      final failureOrUser = await createUser(event.userCreate);
      //print(failureOrUser);
      //print(event.userCreate);
      failureOrUser.fold(
        (failure) => emit(UserError(failure.toString())),
        (user) => emit(UserCreateState(user)),
      );
    });

    on<UserUpdateEvent>((event, emit) async {
      emit(UserLoading());
      final failureOrUser = await updateUser(event.user);
      failureOrUser.fold(
        (failure) => emit(UserError(failure.toString())),
        (user) => emit(UserUpdateState(user)),
      );
    });

    on<UserDeleteEvent>((event, emit) async {
      emit(UserLoading());
      final failureOrUser = await deleteUser(event.user);
      failureOrUser.fold(
        (failure) => emit(UserError(failure.toString())),
        (user) => emit(UserDeleteState(user)),
      );
    });

    on<UserInitialEvent>((event, emit) {
      emit(UserInitial());
    });
  }
}
