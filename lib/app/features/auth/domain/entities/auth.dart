import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String userName;
  final String password;

  const Auth({
    required this.userName,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userName, password];
}
