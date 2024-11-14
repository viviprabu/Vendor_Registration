import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_update.dart';

abstract interface class AppSettingRepository {
  Future<Either<Failure, AppSetting>> getAppSetting(int id);
  Future<Either<Failure, AppSetting>> updateAppSetting(
      AppSettingUpdate appSettingUpdate);
  Future<Either<Failure, AppSetting>> deleteAppSetting(AppSetting appSetting);
  Future<Either<Failure, AppSetting>> createAppSetting(AppSetting appSetting);
  Future<Either<Failure, List<AppSetting>>> getAppSettings();
}
