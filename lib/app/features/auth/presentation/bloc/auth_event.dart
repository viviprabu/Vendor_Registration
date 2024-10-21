part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String userName;
  final String password;
  const AuthSignInEvent({
    required this.userName,
    required this.password,
  });

  @override
  List<Object> get props => [userName, password];
}

class AuthSignOutEvent extends AuthEvent {}

class AuthIsSignedInEvent extends AuthEvent {}

class GetAuthenicatedUserEvent extends AuthEvent {}
