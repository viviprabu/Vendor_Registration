import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';

class Token extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  final User? user;

  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        accessToken,
        refreshToken,
        user,
      ];
}
