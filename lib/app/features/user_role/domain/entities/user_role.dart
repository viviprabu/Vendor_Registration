import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/user_role/domain/entities/role_function.dart';

class UserRole extends Equatable {
  final int id;
  final String name;
  final bool? isActive;
  final bool? isEnable;
  final String? description;
  final RoleFunction? roleFunction;
  bool isSelected = false;

  UserRole({
    required this.id,
    required this.name,
    this.isActive = true,
    this.isEnable = true,
    this.description,
    this.roleFunction,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isActive,
        isEnable,
        description,
        roleFunction,
      ];
}
