part of 'user_permission_bloc.dart';

abstract class UserPermissionEvent extends Equatable {
  const UserPermissionEvent();

  @override
  List<Object> get props => [];
}

class GetUserPermissions extends UserPermissionEvent {
  final int roleId;

  const GetUserPermissions({required this.roleId});

  @override
  List<Object> get props => [roleId];
}

class UserPermissionInitialEvent extends UserPermissionEvent {}
