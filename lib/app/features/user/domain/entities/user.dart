import 'package:equatable/equatable.dart';

class User extends Equatable {
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
  bool isSelected = false;

  User(
      {this.id,
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
      this.sectionId});

  @override
  List<Object?> get props => [
        id,
        name,
        userName,
        email,
        emailConfirmed,
        phoneNumber,
        mobileNumber,
        officePhone,
        description,
        phoneNumberConfirmed,
        lockoutEnd,
        lockoutEnabled,
        isActive,
        isSuspended,
        suspendReason,
        role,
        isDarkMode,
        businessRoleId,
        languageId,
        roleId,
        language,
        dateOfBirth,
        logoPath,
        sectionId
      ];
}
