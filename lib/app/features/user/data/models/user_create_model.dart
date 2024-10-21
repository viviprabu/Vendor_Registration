import 'package:finance_app/app/features/user/domain/entities/user_create.dart';

class UserCreateModel {
  final String? name;
  final String? email;
  final String? password;
  final String? mobileNumber;
  final String? phoneNumber;
  final String? officePhone;
  final int? roleId;
  final int? businessRoleId;
  final bool? isDarkMode;
  final bool? isActive;
  final int? languageId;
  final String? logoPath;
  final String? logoFileName;
  final String? description;

  const UserCreateModel({
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.phoneNumber,
    required this.officePhone,
    required this.roleId,
    required this.businessRoleId,
    required this.isDarkMode,
    required this.isActive,
    required this.languageId,
    required this.logoPath,
    required this.logoFileName,
    required this.description,
  });

  factory UserCreateModel.fromJson(Map<String, dynamic> json) {
    return UserCreateModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      mobileNumber: json["mobileNumber"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      officePhone: json["officePhone"] ?? "",
      roleId: json["roleId"] ?? 0,
      businessRoleId: json["businessRoleId"] ?? 0,
      isDarkMode: json["isDarkMode"] ?? false,
      isActive: json["isActive"] ?? false,
      languageId: json["languageId"] ?? 0,
      logoPath: json["logoPath"] ?? "",
      logoFileName: json["logoFileName"] ?? "",
      description: json["description"] ?? "",
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "mobileNumber": mobileNumber,
      "phoneNumber": phoneNumber,
      "officePhone": officePhone,
      "roleId": roleId,
      "businessRoleId": businessRoleId,
      "isDarkMode": isDarkMode,
      "isActive": isActive,
      "languageId": languageId,
      "logoPath": logoPath,
      "logoFileName": logoFileName,
      "description": description,
    };
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "mobileNumber": mobileNumber,
        "phoneNumber": phoneNumber,
        "officePhone": officePhone,
        "roleId": roleId,
        "businessRoleId": businessRoleId,
        "isDarkMode": isDarkMode,
        "isActive": isActive,
        "languageId": languageId,
        "logoPath": logoPath,
        "logoFileName": logoFileName,
        "description": description,
      };

  factory UserCreateModel.fromEntity(UserCreate userCreate) {
    return UserCreateModel(
      name: userCreate.name,
      email: userCreate.email,
      password: userCreate.password,
      mobileNumber: userCreate.mobileNumber,
      phoneNumber: userCreate.phoneNumber,
      officePhone: userCreate.officePhone,
      roleId: userCreate.roleId,
      businessRoleId: userCreate.businessRoleId,
      isDarkMode: userCreate.isDarkMode,
      isActive: userCreate.isActive,
      languageId: userCreate.languageId,
      logoPath: userCreate.logoPath,
      logoFileName: userCreate.logoFileName,
      description: userCreate.description,
    );
  }

  UserCreate toEntity() {
    return UserCreate(
      name: name,
      email: email,
      password: password,
      mobileNumber: mobileNumber,
      phoneNumber: phoneNumber,
      officePhone: officePhone,
      roleId: roleId,
      businessRoleId: businessRoleId,
      isDarkMode: isDarkMode,
      isActive: isActive,
      languageId: languageId,
      logoPath: logoPath,
      logoFileName: logoFileName,
      description: description,
    );
  }
}
