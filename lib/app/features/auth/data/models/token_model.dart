import 'package:finance_app/app/features/auth/data/models/cookie_options_model.dart';
import 'package:finance_app/app/features/auth/data/models/user_model.dart';
import 'package:finance_app/app/features/auth/domain/entities/token.dart';

class TokenModel {
  final String? accessToken;
  final String? refreshToken;
  final UserModel? user;
  final CookieOptionsModel? cookieOptions;

  TokenModel({
    this.accessToken,
    this.refreshToken,
    this.user,
    this.cookieOptions,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: UserModel.fromJson(json['user']),
      cookieOptions: CookieOptionsModel.fromJson(json['cookieOptions']),
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "user": user?.toJson(),
        "cookieOptions": cookieOptions?.toJson(),
      };

  Token toEntity() {
    return Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user?.toEntity(),
      cookieOptions: cookieOptions?.toEntity(),
    );
  }
}
