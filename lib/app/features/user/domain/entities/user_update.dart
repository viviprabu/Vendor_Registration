import 'package:equatable/equatable.dart';

class UserUpdate extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? userName;
  final String? mobileNumber;
  final String? homePhone;
  final String? phoneNumber;
  final String? officePhone;
  final int? roleId;
  final int? businessRoleId;
  final bool? isDarkMode;
  final bool? isActive;
  final bool? isSuspended;
  final String? suspendReason;
  final int? languageId;
  final String? logoFile;
  final String? logoPath;
  final String? description;

  const UserUpdate({
    required this.id,
    required this.name,
    required this.email,
    required this.userName,
    required this.mobileNumber,
    required this.homePhone,
    required this.phoneNumber,
    required this.officePhone,
    required this.roleId,
    required this.businessRoleId,
    required this.isDarkMode,
    required this.isActive,
    required this.isSuspended,
    required this.suspendReason,
    required this.languageId,
    required this.logoFile,
    required this.logoPath,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        userName,
        mobileNumber,
        homePhone,
        phoneNumber,
        officePhone,
        roleId,
        businessRoleId,
        isDarkMode,
        isActive,
        isSuspended,
        suspendReason,
        languageId,
        logoFile,
        logoPath,
        description,
      ];
}
