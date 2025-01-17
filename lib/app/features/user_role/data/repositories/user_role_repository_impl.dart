import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/user_role/data/datasources/user_role_remote_data_source.dart';
import 'package:vendor_registration/app/features/user_role/data/models/role_function_model.dart';
import 'package:vendor_registration/app/features/user_role/data/models/system_function_model.dart';
import 'package:vendor_registration/app/features/user_role/data/models/user_role_model.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/role_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/system_function.dart';
import 'package:vendor_registration/app/features/user_role/domain/entities/user_role.dart';
import 'package:vendor_registration/app/features/user_role/domain/repositories/user_role_repository.dart';

class UserRoleRepositoryImpl implements UserRoleRepository {
  final UserRoleRemoteDataSource userRoleRemoteDataSource;
  UserRoleRepositoryImpl({
    required this.userRoleRemoteDataSource,
  });

  @override
  Future<Either<Failure, UserRole>> createUserRole(UserRole userRole) async {
    try {
      final UserRoleModel userRoleModel = UserRoleModel.fromEntity(userRole);

      final UserRoleModel createdUserRole =
          await userRoleRemoteDataSource.createUserRole(userRoleModel);
      return Right(createdUserRole.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, List<RoleFunction>>> getUserRoleFunctions(
      int id) async {
    try {
      final List<RoleFunctionModel> userRoleFunctions =
          await userRoleRemoteDataSource.getUserRoleFunctions(id);
      final List<RoleFunction> userRoleFunctionsList = userRoleFunctions
          .map((roleFunction) => roleFunction.toEntity())
          .toList();
      return Right(userRoleFunctionsList);
    } catch (e) {
      //print(e);
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserRole>>> listUserRoles() async {
    try {
      final List<UserRoleModel> userRoles =
          await userRoleRemoteDataSource.listUserRoles();
      final List<UserRole> userRolesList =
          userRoles.map((userRole) => userRole.toEntity()).toList();
      return Right(userRolesList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserRole>> updateUserRole(UserRole userRole) async {
    try {
      final UserRoleModel userRoleModel = UserRoleModel.fromEntity(userRole);
      final UserRoleModel updatedUserRole =
          await userRoleRemoteDataSource.updateUserRole(userRoleModel);
      return Right(updatedUserRole.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SystemFunction>>> listSystemFunctions() async {
    try {
      final List<SystemFunctionModel> systemFunctions =
          await userRoleRemoteDataSource.listSystemFunctions();
      final List<SystemFunction> systemFunctionsList = systemFunctions
          .map((systemFunction) => systemFunction.toEntity())
          .toList();
      return Right(systemFunctionsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
