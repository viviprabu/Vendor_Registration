import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/repositories/appsetting_repository.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetAppSettings {
  final AppSettingRepository repository;

  GetAppSettings(this.repository);

  Future<Either<Failure, List<AppSetting>>> call() async {
    return await repository.getAppSettings();
  }
}
