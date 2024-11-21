import 'package:finance_app/app/features/auth/data/models/user_rights_model.dart';
import 'package:finance_app/app/features/user/domain/entities/user.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? userName;
  final String? email;
  final bool? emailConfirmed;
  final String? phoneNumber;
  final String? mobileNumber;
  final String? officePhone;
  final String? description;
  final bool? phoneNumberConfirmed;
  final String? lockoutEnd;
  final bool? lockoutEnabled;
  final bool? isActive;
  final bool? isSuspended;
  final String? suspendReason;
  final String? role;
  final bool? isDarkMode;
  final int? businessRoleId;
  final int? languageId;
  final int? roleId;
  final String? language;
  final String? dateOfBirth;
  final String? logoPath;
  final String? sectionId;
  List<UserRightsModel>? userRights;

  UserModel({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.emailConfirmed,
    this.phoneNumber,
    this.mobileNumber,
    this.officePhone,
    this.description,
    this.phoneNumberConfirmed,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.isActive,
    this.isSuspended,
    this.suspendReason,
    this.role,
    this.isDarkMode,
    this.businessRoleId,
    this.languageId,
    this.roleId,
    this.language,
    this.dateOfBirth,
    this.logoPath,
    this.sectionId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      userName: json["userName"] ?? "",
      email: json["email"] ?? "",
      emailConfirmed: json["emailConfirmed"] ?? false,
      phoneNumber: json["phoneNumber"] ?? "",
      mobileNumber: json["mobileNumber"] ?? "",
      officePhone: json["officePhone"] ?? "",
      description: json["description"] ?? "",
      phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? false,
      lockoutEnd: json["lockoutEnd"] ?? "",
      lockoutEnabled: json["lockoutEnabled"] ?? false,
      isActive: json["isActive"] ?? false,
      isSuspended: json["isSuspended"] ?? false,
      suspendReason: json["suspendReason"] ?? "",
      role: json["role"] ?? "",
      isDarkMode: json["isDarkMode"] ?? false,
      businessRoleId: json["businessRoleId"] ?? 0,
      languageId: json["languageId"] ?? 0,
      roleId: json["roleId"] ?? 0,
      language: json["language"] ?? "",
      dateOfBirth: json["dateOfBirth"] ?? "",
      logoPath: json["logoPath"] ?? "",
      sectionId: json["sectionId"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "userName": userName,
        "email": email,
        "emailConfirmed": emailConfirmed,
        "phoneNumber": phoneNumber,
        "mobileNumber": mobileNumber,
        "officePhone": officePhone,
        "description": description,
        "phoneNumberConfirmed": phoneNumberConfirmed,
        "lockoutEnd": lockoutEnd,
        "lockoutEnabled": lockoutEnabled,
        "isActive": isActive,
        "isSuspended": isSuspended,
        "suspendReason": suspendReason,
        "role": role,
        "isDarkMode": isDarkMode,
        "businessRoleId": businessRoleId,
        "languageId": languageId,
        "roleId": roleId,
        "language": language,
        "dateOfBirth": dateOfBirth,
        "logoPath": logoPath,
        "sectionID": sectionId
      };

  factory UserModel.fromEntity(User user) {
    return UserModel(
        id: user.id,
        name: user.name,
        userName: user.userName,
        email: user.email,
        emailConfirmed: user.emailConfirmed,
        phoneNumber: user.phoneNumber,
        mobileNumber: user.mobileNumber,
        officePhone: user.officePhone,
        description: user.description,
        phoneNumberConfirmed: user.phoneNumberConfirmed,
        lockoutEnd: user.lockoutEnd,
        lockoutEnabled: user.lockoutEnabled,
        isActive: user.isActive,
        isSuspended: user.isSuspended,
        suspendReason: user.suspendReason,
        role: user.role,
        isDarkMode: user.isDarkMode,
        businessRoleId: user.businessRoleId,
        languageId: user.languageId,
        roleId: user.roleId,
        language: user.language,
        dateOfBirth: user.dateOfBirth,
        logoPath: user.logoPath,
        sectionId: user.sectionId);
  }

  User toEntity() {
    return User(
        id: id,
        name: name,
        userName: userName,
        email: email,
        emailConfirmed: emailConfirmed,
        phoneNumber: phoneNumber,
        mobileNumber: mobileNumber,
        officePhone: officePhone,
        description: description,
        phoneNumberConfirmed: phoneNumberConfirmed,
        lockoutEnd: lockoutEnd,
        lockoutEnabled: lockoutEnabled,
        isActive: isActive,
        isSuspended: isSuspended,
        suspendReason: suspendReason,
        role: role,
        isDarkMode: isDarkMode,
        businessRoleId: businessRoleId,
        languageId: languageId,
        roleId: roleId,
        sectionId: sectionId);
  }
}
