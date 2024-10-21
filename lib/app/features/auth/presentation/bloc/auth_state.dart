part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSignedInState extends AuthState {
  final String email;
  final String password;
  const AuthSignedInState(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class AuthenticatedState extends AuthState {
  final Token token;
  const AuthenticatedState(this.token);

  @override
  List<Object> get props => [token];
}

class AuthSignedOutState extends AuthState {}

class AuthIsSignedInState extends AuthState {
  final bool isSignedIn;
  const AuthIsSignedInState(this.isSignedIn);

  @override
  List<Object> get props => [isSignedIn];
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class GetAuthenicatedUserState extends AuthState {
  final User user;
  const GetAuthenicatedUserState(this.user);

  @override
  List<Object> get props => [user];
}
