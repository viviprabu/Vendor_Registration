part of 'user_role_bloc.dart';

abstract class UserRoleState extends Equatable {
  const UserRoleState();

  @override
  List<Object> get props => [];
}

class UserRoleInitialState extends UserRoleState {}

class UserRoleLoading extends UserRoleState {}

class UserRoleError extends UserRoleState {
  final String message;

  const UserRoleError(this.message);

  @override
  List<Object> get props => [message];
}

class UserRoleCreate extends UserRoleState {
  final UserRole userRole;

  const UserRoleCreate(this.userRole);

  @override
  List<Object> get props => [userRole];
}

class UserRoleUpdate extends UserRoleState {
  final UserRole userRole;

  const UserRoleUpdate(this.userRole);

  @override
  List<Object> get props => [userRole];
}

class UserRoleList extends UserRoleState {
  final List<RoleFunction> userRoleFunctions;

  const UserRoleList(this.userRoleFunctions);

  @override
  List<Object> get props => [userRoleFunctions];
}

class UserRolesList extends UserRoleState {
  final List<UserRole> userRoles;

  const UserRolesList(this.userRoles);

  @override
  List<Object> get props => [userRoles];
}

class SystemFunctionList extends UserRoleState {
  final List<SystemFunction> systemFunctions;

  const SystemFunctionList(this.systemFunctions);

  @override
  List<Object> get props => [systemFunctions];
}
