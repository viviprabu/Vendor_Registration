import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/repositories/appsetting_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class CreateAppSetting {
  final AppSettingRepository appSettingRepository;

  CreateAppSetting(this.appSettingRepository);

  Future<Either<Failure, AppSetting>> call(AppSetting appSetting) async {
    return await appSettingRepository.createAppSetting(appSetting);
  }
}
