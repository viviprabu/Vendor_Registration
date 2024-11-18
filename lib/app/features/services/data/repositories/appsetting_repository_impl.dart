import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/services/data/datasources/appsetting_remote_data_source.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_modal.dart';
import 'package:finance_app/app/features/services/data/models/appsetting_update_model.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_update.dart';
import 'package:finance_app/app/features/services/domain/repositories/appsetting_repository.dart';

class AppSettingRepositoryImpl implements AppSettingRepository {
  final AppSettingRemoteDataSource appSettingRemoteDataSource;

  AppSettingRepositoryImpl({required this.appSettingRemoteDataSource});

  @override
  Future<Either<Failure, AppSetting>> createAppSetting(
      AppSetting appSetting) async {
    try {
      final AppSettingModal appSettingModal =
          AppSettingModal.fromEntity(appSetting);
      final AppSettingModal createdAppSetting =
          await appSettingRemoteDataSource.createAppSetting(appSettingModal);
      return Right(createdAppSetting.toEntity());
    } catch (e) {
      final ServerFailure serverFailure = ServerFailure(e.toString());
      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, AppSetting>> deleteAppSetting(AppSetting appSetting) {
    // TODO: implement deleteSector
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AppSetting>> getAppSetting(int id) async {
    try {
      final AppSettingModal appSettingModal =
          await appSettingRemoteDataSource.getAppSetting(id);
      return Right(appSettingModal.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppSetting>>> getAppSettings() async {
    try {
      final List<AppSettingModal> appSettings =
          await appSettingRemoteDataSource.getAppSettings();
      final List<AppSetting> appSettingList =
          appSettings.map((app) => app.toEntity()).toList();
      return Right(appSettingList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AppSetting>> updateAppSetting(
      AppSettingUpdate appSettingUpdate) async {
    try {
      /* final UserModel updatedUser =
          await userRemoteDataSource.updateUser(user as UserModel);
      return Right(updatedUser.toEntity()); */

      final AppSettingUpdateModal appSettingUpdateModel =
          AppSettingUpdateModal.fromEntity(appSettingUpdate);
      final AppSettingModal updatedAppSetting = await appSettingRemoteDataSource
          .updateAppSetting(appSettingUpdateModel);
      return Right(updatedAppSetting.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
