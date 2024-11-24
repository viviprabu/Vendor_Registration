import 'package:equatable/equatable.dart';

class CookieOptions extends Equatable {
  final String? domain;
  final String? path;
  final DateTime? expires;
  final bool? secure;
  final int? sameSite;
  final bool? httpOnly;
  final String? maxAge;
  final bool? isEssential;
  final List<String?> extensions;

  const CookieOptions({
    required this.domain,
    required this.path,
    required this.expires,
    required this.secure,
    required this.sameSite,
    required this.httpOnly,
    required this.maxAge,
    required this.isEssential,
    required this.extensions,
  });

  @override
  List<Object?> get props => [
        domain,
        path,
        expires,
        secure,
        sameSite,
        httpOnly,
        maxAge,
        isEssential,
        extensions,
      ];
}
