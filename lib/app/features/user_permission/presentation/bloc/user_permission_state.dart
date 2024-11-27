part of 'user_permission_bloc.dart';

abstract class UserPermissionState extends Equatable {
  const UserPermissionState();

  @override
  List<Object> get props => [];
}

class UserPermissionInitial extends UserPermissionState {}

class UserPermissionLoading extends UserPermissionState {}

class UserPermissionError extends UserPermissionState {
  final String message;

  const UserPermissionError(this.message);

  @override
  List<Object> get props => [message];
}

class UserPermissionLoaded extends UserPermissionState {
  final List<RoleFunction> roleFunctions;

  const UserPermissionLoaded(this.roleFunctions);

  @override
  List<Object> get props => [roleFunctions];
}
