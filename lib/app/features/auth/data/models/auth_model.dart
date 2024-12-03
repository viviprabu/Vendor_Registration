import 'package:vendor_registration/app/features/auth/domain/entities/auth.dart';

class AuthModel {
  final String userName;
  final String password;

  AuthModel({
    required this.userName,
    required this.password,
  });

  factory AuthModel.fromEntity(Auth auth) {
    return AuthModel(
      userName: auth.userName,
      password: auth.password,
    );
  }

  Auth toEntity() {
    return Auth(
      userName: userName,
      password: password,
    );
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      userName: json['userName'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'password': password,
    };
  }
}
