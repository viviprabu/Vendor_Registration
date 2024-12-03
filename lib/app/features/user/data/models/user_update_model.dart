import 'package:vendor_registration/app/features/user/domain/entities/user_update.dart';

class UserUpdateModel extends UserUpdate {
  const UserUpdateModel({
    required super.id,
    required super.name,
    required super.email,
    required super.userName,
    required super.mobileNumber,
    required super.homePhone,
    required super.phoneNumber,
    required super.officePhone,
    required super.roleId,
    required super.businessRoleId,
    required super.isDarkMode,
    required super.isActive,
    required super.isSuspended,
    required super.suspendReason,
    required super.languageId,
    required super.logoFile,
    required super.logoPath,
    required super.description,
  });

  factory UserUpdateModel.fromJson(Map<String, dynamic> json) {
    return UserUpdateModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      userName: json["userName"] ?? "",
      mobileNumber: json["mobileNumber"] ?? "",
      homePhone: json["homePhone"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      officePhone: json["officePhone"] ?? "",
      roleId: json["roleId"] ?? 0,
      businessRoleId: json["businessRoleId"] ?? 0,
      isDarkMode: json["isDarkMode"] ?? false,
      isActive: json["isActive"] ?? false,
      isSuspended: json["isSuspended"] ?? false,
      suspendReason: json["suspendReason"] ?? "",
      languageId: json["languageId"] ?? 0,
      logoFile: json["logoFile"] ?? "",
      logoPath: json["logoPath"] ?? "",
      description: json["description"] ?? "",
    );
  }

  // have to send as a form data

  Map<String, dynamic> toFormData() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "userName": userName,
      "mobileNumber": mobileNumber,
      "homePhone": homePhone,
      "phoneNumber": phoneNumber,
      "officePhone": officePhone,
      "roleId": roleId,
      "businessRoleId": businessRoleId,
      "isDarkMode": isDarkMode,
      "isActive": isActive,
      "isSuspended": isSuspended,
      "suspendReason": suspendReason,
      "languageId": languageId,
      "logoFile": logoFile,
      "logoPath": logoPath,
      "description": description,
    };
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "userName": userName,
        "mobileNumber": mobileNumber,
        "homePhone": homePhone,
        "phoneNumber": phoneNumber,
        "officePhone": officePhone,
        "roleId": roleId,
        "businessRoleId": businessRoleId,
        "isDarkMode": isDarkMode,
        "isActive": isActive,
        "isSuspended": isSuspended,
        "suspendReason": suspendReason,
        "languageId": languageId,
        "logoFile": logoFile,
        "logoPath": logoPath,
        "description": description,
      };

  // fromEninty
  factory UserUpdateModel.fromEntity(UserUpdate userUpdate) {
    return UserUpdateModel(
      id: userUpdate.id,
      name: userUpdate.name,
      email: userUpdate.email,
      userName: userUpdate.userName,
      mobileNumber: userUpdate.mobileNumber,
      homePhone: userUpdate.homePhone,
      phoneNumber: userUpdate.phoneNumber,
      officePhone: userUpdate.officePhone,
      roleId: userUpdate.roleId,
      businessRoleId: userUpdate.businessRoleId,
      isDarkMode: userUpdate.isDarkMode,
      isActive: userUpdate.isActive,
      isSuspended: userUpdate.isSuspended,
      suspendReason: userUpdate.suspendReason,
      languageId: userUpdate.languageId,
      logoFile: userUpdate.logoFile,
      logoPath: userUpdate.logoPath,
      description: userUpdate.description,
    );
  }

  // toEntity
  UserUpdate toEntity() {
    return UserUpdate(
      id: id,
      name: name,
      email: email,
      userName: userName,
      mobileNumber: mobileNumber,
      homePhone: homePhone,
      phoneNumber: phoneNumber,
      officePhone: officePhone,
      roleId: roleId,
      businessRoleId: businessRoleId,
      isDarkMode: isDarkMode,
      isActive: isActive,
      isSuspended: isSuspended,
      suspendReason: suspendReason,
      languageId: languageId,
      logoFile: logoFile,
      logoPath: logoPath,
      description: description,
    );
  }
}
