import 'package:finance_app/app/features/appsetting/domain/entities/appsetting.dart';
import 'package:finance_app/app/features/appsetting/domain/repositories/appsetting_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';

class GetAppSetting {
  final AppSettingRepository repository;

  GetAppSetting(this.repository);

  Future<Either<Failure, AppSetting>> call(int id) async {
    return await repository.getAppSetting(id);
  }
}
