import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting_update.dart';
import 'package:finance_app/app/features/services/domain/repositories/appsetting_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class UpdateAppsetting {
  final AppSettingRepository appSettingRepository;

  UpdateAppsetting(this.appSettingRepository);

  Future<Either<Failure, AppSetting>> call(
      AppSettingUpdate appSettingUpdate) async {
    return await appSettingRepository.updateAppSetting(appSettingUpdate);
  }
}
