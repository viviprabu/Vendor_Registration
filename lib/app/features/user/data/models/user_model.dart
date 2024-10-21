import 'package:finance_app/app/features/user/domain/entities/user.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? userName;
  final String? email;
  final bool? emailConfirmed;
  final String? phoneNumber;
  final bool? phoneNumberConfirmed;
  final String? lockoutEnd;
  final bool? lockoutEnabled;
  final bool? isActive;
  final bool? isSuspended;
  final String? roleName;
  final bool? isDarkMode;
  final num? businessRoleId;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.emailConfirmed,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.lockoutEnd,
    required this.lockoutEnabled,
    required this.isActive,
    required this.isSuspended,
    required this.roleName,
    required this.isDarkMode,
    required this.businessRoleId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      userName: json["userName"] ?? "",
      email: json["email"] ?? "",
      emailConfirmed: json["emailConfirmed"] ?? false,
      phoneNumber: json["phoneNumber"] ?? "",
      phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
      lockoutEnd: json["lockoutEnd"],
      lockoutEnabled: json["lockoutEnabled"] ?? false,
      isActive: json["isActive"] ?? false,
      isSuspended: json["isSuspended"] ?? false,
      roleName: json["roleName"] ?? "",
      isDarkMode: json["isDarkMode"] ?? false,
      businessRoleId: json["businessRoleId"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "userName": userName,
        "email": email,
        "emailConfirmed": emailConfirmed,
        "phoneNumber": phoneNumber,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "isActive": isActive,
        "isSuspended": isSuspended,
        "roleName": roleName,
        "isDarkMode": isDarkMode,
        "businessRoleId": businessRoleId,
      };

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      userName: user.userName,
      email: user.email,
      emailConfirmed: user.emailConfirmed,
      phoneNumber: user.phoneNumber,
      phoneNumberConfirmed: user.phoneNumberConfirmed,
      lockoutEnd: user.lockoutEnd,
      lockoutEnabled: user.lockoutEnabled,
      isActive: user.isActive,
      isSuspended: user.isSuspended,
      roleName: user.roleName,
      isDarkMode: user.isDarkMode,
      businessRoleId: user.businessRoleId,
    );
  }

  User toEntity() {
    return User(
      id: id,
      name: name,
      userName: userName,
      email: email,
      emailConfirmed: emailConfirmed,
      phoneNumber: phoneNumber,
      phoneNumberConfirmed: phoneNumberConfirmed,
      lockoutEnd: lockoutEnd,
      lockoutEnabled: lockoutEnabled,
      isActive: isActive,
      isSuspended: isSuspended,
      roleName: roleName,
      isDarkMode: isDarkMode,
      businessRoleId: businessRoleId,
    );
  }
}
