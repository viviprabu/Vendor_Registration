import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/role_function.dart';

class UserRole extends Equatable {
  final int id;
  final String name;
  final bool? isActive;
  final bool? isEditable;
  final String? description;
  final List<RoleFunction>? roleSystemFunctions;
  bool isSelected = false;

  UserRole({
    required this.id,
    required this.name,
    this.isActive = true,
    this.isEditable = true,
    this.description,
    this.roleSystemFunctions,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isActive,
        isEditable,
        description,
        roleSystemFunctions,
      ];
}
