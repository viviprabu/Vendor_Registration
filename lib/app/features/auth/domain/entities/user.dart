import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/auth/domain/entities/user_rights.dart';

class User extends Equatable {
  String? id;
  String? name;
  String? userName;
  String? email;
  bool? emailConfirmed;
  String? phoneNumber;
  bool? phoneNumberConfirmed;
  String? lockoutEnd;
  bool? lockoutEnabled;
  bool? isActive;
  bool? isSuspended;
  String? roleName;
  bool? isDarkMode;
  int? languageId;
  String? languageName;
  List<UserRights>? userRights;

  User({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.emailConfirmed,
    this.phoneNumber,
    this.phoneNumberConfirmed,
    this.lockoutEnd,
    this.lockoutEnabled,
    this.isActive,
    this.isSuspended,
    this.roleName,
    this.isDarkMode,
    this.languageId,
    this.languageName,
    this.userRights,
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
        languageId,
        languageName,
        userRights,
      ];
}
