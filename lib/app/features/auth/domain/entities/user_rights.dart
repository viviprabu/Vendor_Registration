import 'package:equatable/equatable.dart';

class UserRights extends Equatable {
  final int applicationSettingId;
  final String? applicationSettingName;
  final int roleId;
  final String? roleName;

  const UserRights({
    required this.applicationSettingId,
    required this.applicationSettingName,
    required this.roleId,
    required this.roleName,
  });

  @override
  List<Object?> get props => [
        applicationSettingId,
        applicationSettingName,
        roleId,
        roleName,
      ];
}
