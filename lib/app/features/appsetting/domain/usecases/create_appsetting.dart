import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/repositories/appsetting_repository.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class CreateAppSetting {
  final AppSettingRepository appSettingRepository;

  CreateAppSetting(this.appSettingRepository);

  Future<Either<Failure, AppSetting>> call(AppSetting appSetting) async {
    return await appSettingRepository.createAppSetting(appSetting);
  }
}
