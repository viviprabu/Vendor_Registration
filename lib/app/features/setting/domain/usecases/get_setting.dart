import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';

class GetSetting {
  final SettingRepository repository;

  GetSetting(this.repository);

  Future<Either<Failure, Setting>> call(String id) async {
    return await repository.getSetting(id);
  }
}
