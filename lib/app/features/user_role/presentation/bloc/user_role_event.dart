part of 'user_role_bloc.dart';

abstract class UserRoleEvent extends Equatable {
  const UserRoleEvent();

  @override
  List<Object> get props => [];
}

class UserRoleInitialEvent extends UserRoleEvent {}

class UserRoleListEvent extends UserRoleEvent {
  final int id;
  const UserRoleListEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UserRolesListEvent extends UserRoleEvent {}

class UserRoleCreateEvent extends UserRoleEvent {
  final UserRole userRole;
  const UserRoleCreateEvent(this.userRole);

  @override
  List<Object> get props => [userRole];
}

class UserRoleUpdateEvent extends UserRoleEvent {
  final UserRole userRole;
  const UserRoleUpdateEvent(this.userRole);

  @override
  List<Object> get props => [userRole];
}

class SystemFunctionsEvent extends UserRoleEvent {}
