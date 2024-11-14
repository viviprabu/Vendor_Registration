import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';

class DeleteSetting {
  final SettingRepository settingRepository;

  DeleteSetting(this.settingRepository);

  Future<Either<Failure, Setting>> call(Setting setting) async {
    return await settingRepository.deleteSetting(setting);
  }
}
