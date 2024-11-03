import 'package:finance_app/app/features/auth/domain/entities/token.dart';
import 'package:finance_app/app/features/user/data/models/user_model.dart';

class TokenModel {
  TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userModel,
  });

  final String? accessToken;
  final String? refreshToken;
  final UserModel? userModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      userModel:
          json["userModel"] == null ? null : UserModel.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "userModel": userModel?.toJson(),
      };

  Token toEntity() {
    return Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: userModel?.toEntity(),
    );
  }
}
