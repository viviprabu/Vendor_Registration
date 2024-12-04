import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/user_permission/data/datasources/user_permission_remote_data_source.dart';
import 'package:vendor_registration/app/features/user_permission/data/models/role_function_model.dart';
import 'package:vendor_registration/app/features/user_permission/domain/entities/role_function.dart';
import 'package:vendor_registration/app/features/user_permission/domain/repositories/user_permission_repository.dart';

class UserPermissionRepositoryImpl implements UserPermissionRepository {
  final UserPermissionRemoteDataSource userPermissionRemoteDataSource;

  UserPermissionRepositoryImpl(this.userPermissionRemoteDataSource);

  @override
  Future<Either<Failure, List<RoleFunction>>> getUserRoleFunctions(
      int roleId) async {
    try {
      final List<RoleFunctionModel> userRoleFunctions =
          await userPermissionRemoteDataSource.getUserRoleFunctions(roleId);
      final List<RoleFunction> userRoleFunctionsList = userRoleFunctions
          .map((roleFunction) => roleFunction.toEntity())
          .toList();
      return Right(userRoleFunctionsList);
    } catch (e) {
      //print(e);
      return Left(ServerFailure(e.toString()));
    }
  }
}
