import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/repositories/appsetting_repository.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class UpdateAppSetting {
  final AppSettingRepository appSettingRepository;

  UpdateAppSetting(this.appSettingRepository);

  Future<Either<Failure, AppSetting>> call(AppSetting appSetting) async {
    return await appSettingRepository.updateAppSetting(appSetting);
  }
}
