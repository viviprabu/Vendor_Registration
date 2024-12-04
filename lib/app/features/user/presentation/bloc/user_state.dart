part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UsersListState extends UserState {
  final List<User> users;
  const UsersListState(this.users);

  @override
  List<Object> get props => [users];
}

class UserCreateState extends UserState {
  final User user;
  const UserCreateState(this.user);

  @override
  List<Object> get props => [user];
}

class UserUpdateState extends UserState {
  final User user;
  const UserUpdateState(this.user);

  @override
  List<Object> get props => [user];
}

class UserDeleteState extends UserState {
  final User user;
  const UserDeleteState(this.user);

  @override
  List<Object> get props => [user];
}

class UserListState extends UserState {
  final User user;
  const UserListState(this.user);

  @override
  List<Object> get props => [user];
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);

  @override
  List<Object> get props => [message];
}
