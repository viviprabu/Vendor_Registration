import 'package:equatable/equatable.dart';

class User extends Equatable {
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
  bool isSelected = false;

  User({
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

  @override
  List<Object?> get props => [
        id,
        name,
        userName,
        email,
        emailConfirmed,
        phoneNumber,
        phoneNumberConfirmed,
        lockoutEnd,
        lockoutEnabled,
        isActive,
        isSuspended,
        roleName,
        isDarkMode,
        businessRoleId,
      ];
}
