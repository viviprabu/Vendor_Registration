import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/auth/domain/entities/cookie_options.dart';
import 'package:vendor_registration/app/features/auth/domain/entities/user.dart';

class Token extends Equatable {
  final String accessToken;
  final String refreshToken;
  final User? user;
  final CookieOptions? cookieOptions;

  const Token({
    required this.accessToken,
    required this.refreshToken,
    this.user,
    this.cookieOptions,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        accessToken,
        refreshToken,
        user,
        cookieOptions,
      ];
}
