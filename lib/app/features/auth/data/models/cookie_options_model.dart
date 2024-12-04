import 'package:vendor_registration/app/features/auth/domain/entities/cookie_options.dart';

class CookieOptionsModel {
  CookieOptionsModel({
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

  final String? domain;
  final String? path;
  final DateTime? expires;
  final bool? secure;
  final int? sameSite;
  final bool? httpOnly;
  final String? maxAge;
  final bool? isEssential;
  final List<String?> extensions;

  factory CookieOptionsModel.fromJson(Map<String, dynamic> json) {
    return CookieOptionsModel(
      domain: json["domain"],
      path: json["path"],
      expires: DateTime.tryParse(json["expires"] ?? ""),
      secure: json["secure"],
      sameSite: json["sameSite"],
      httpOnly: json["httpOnly"],
      maxAge: json["maxAge"],
      isEssential: json["isEssential"],
      extensions: json["extensions"] == null
          ? []
          : List<String?>.from(json["extensions"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "domain": domain,
        "path": path,
        "expires": expires?.toIso8601String(),
        "secure": secure,
        "sameSite": sameSite,
        "httpOnly": httpOnly,
        "maxAge": maxAge,
        "isEssential": isEssential,
        "extensions": extensions.map((x) => x).toList(),
      };

  CookieOptions toEntity() {
    return CookieOptions(
      domain: domain,
      path: path,
      expires: expires,
      secure: secure,
      sameSite: sameSite,
      httpOnly: httpOnly,
      maxAge: maxAge,
      isEssential: isEssential,
      extensions: extensions,
    );
  }
}
