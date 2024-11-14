import 'package:finance_app/app/features/Setting/domain/entities/Setting_create.dart';
import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';

class CreateSetting {
  final SettingRepository settingRepository;

  CreateSetting(this.settingRepository);

  Future<Either<Failure, Setting>> call(SettingCreate settingCreate) async {
    return await settingRepository.createSetting(settingCreate);
  }
}
