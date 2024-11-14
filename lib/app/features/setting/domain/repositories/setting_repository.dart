import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/Setting/domain/entities/Setting_create.dart';
import 'package:finance_app/app/features/Setting/domain/entities/Setting_update.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';

abstract interface class SettingRepository {
  Future<Either<Failure, Setting>> getSetting(String id);
  Future<Either<Failure, Setting>> updateSetting(SettingUpdate settingUpdate);
  Future<Either<Failure, Setting>> deleteSetting(Setting setting);
  Future<Either<Failure, Setting>> createSetting(SettingCreate settingCreate);
  Future<Either<Failure, List<Setting>>> getSettings();
}
