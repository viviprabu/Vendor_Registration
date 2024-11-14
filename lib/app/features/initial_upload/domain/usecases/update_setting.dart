import 'package:finance_app/app/features/Setting/domain/entities/Setting_update.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';

class UpdateSetting {
  final SettingRepository settingRepository;

  UpdateSetting(this.settingRepository);

  Future<Either<Failure, Setting>> call(SettingUpdate settingUpdate) async {
    return await settingRepository.updateSetting(settingUpdate);
  }
}
