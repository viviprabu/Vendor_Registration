import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';

class GetSettings {
  final SettingRepository repository;

  GetSettings(this.repository);

  Future<Either<Failure, List<Setting>>> call() async {
    return await repository.getSettings();
  }
}
