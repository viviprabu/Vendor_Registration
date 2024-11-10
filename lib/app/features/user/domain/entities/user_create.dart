import 'package:equatable/equatable.dart';

class UserCreate extends Equatable {
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
  final String? sectionId;

  const UserCreate(
      {required this.name,
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
      required this.sectionId});

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        mobileNumber,
        phoneNumber,
        officePhone,
        roleId,
        businessRoleId,
        isDarkMode,
        isActive,
        languageId,
        logoPath,
        logoFileName,
        description,
        sectionId
      ];
}
