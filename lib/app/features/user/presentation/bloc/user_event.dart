part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {}

class UsersListEvent extends UserEvent {}

class UserCreateEvent extends UserEvent {
  final UserCreate userCreate;
  const UserCreateEvent(this.userCreate);

  @override
  List<Object> get props => [userCreate];
}

class UserUpdateEvent extends UserEvent {
  final User user;
  const UserUpdateEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UserDeleteEvent extends UserEvent {
  final User user;
  const UserDeleteEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UserListEvent extends UserEvent {
  final String id;
  const UserListEvent(this.id);

  @override
  List<Object> get props => [id];
}
