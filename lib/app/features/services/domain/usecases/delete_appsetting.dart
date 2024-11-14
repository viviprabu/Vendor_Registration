import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/services/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/services/domain/repositories/appsetting_repository.dart';

class DeleteAppSetting {
  final AppSettingRepository appSettingRepository;

  DeleteAppSetting(this.appSettingRepository);

  Future<Either<Failure, AppSetting>> call(AppSetting appSetting) async {
    return await appSettingRepository.deleteAppSetting(appSetting);
  }
}
