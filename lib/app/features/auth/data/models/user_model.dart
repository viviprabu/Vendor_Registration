import 'package:finance_app/app/features/auth/data/models/user_rights_model.dart';
import 'package:finance_app/app/features/auth/domain/entities/user.dart';

class UserModel {
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
  List<UserRightsModel>? userRights;

  UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      userName: json['userName'],
      email: json['email'],
      emailConfirmed: json['emailConfirmed'],
      phoneNumber: json['phoneNumber'],
      phoneNumberConfirmed: json['phoneNumberConfirmed'],
      lockoutEnd: json['lockoutEnd'],
      lockoutEnabled: json['lockoutEnabled'],
      isActive: json['isActive'],
      isSuspended: json['isSuspended'],
      roleName: json['roleName'],
      isDarkMode: json['isDarkMode'],
      languageId: json['languageId'],
      languageName: json['languageName'],
      userRights: json['userRights'] != null
          ? (json['userRights'] as List)
              .map((i) => UserRightsModel.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'emailConfirmed': emailConfirmed,
      'phoneNumber': phoneNumber,
      'phoneNumberConfirmed': phoneNumberConfirmed,
      'lockoutEnd': lockoutEnd,
      'lockoutEnabled': lockoutEnabled,
      'isActive': isActive,
      'isSuspended': isSuspended,
      'roleName': roleName,
      'isDarkMode': isDarkMode,
      'languageId': languageId,
      'languageName': languageName,
      'userRights': userRights?.map((e) => e.toJson()).toList(),
    };
  }

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
      languageId: user.languageId,
      languageName: user.languageName,
      userRights:
          user.userRights?.map((e) => UserRightsModel.fromEntity(e)).toList(),
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
      languageId: languageId,
      languageName: languageName,
      userRights: userRights?.map((e) => e.toEntity()).toList(),
    );
  }
}
