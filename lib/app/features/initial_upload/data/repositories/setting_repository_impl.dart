import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/Setting/domain/entities/Setting_create.dart';
import 'package:finance_app/app/features/Setting/domain/entities/Setting_update.dart';
import 'package:finance_app/app/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:finance_app/app/features/setting/data/models/setting_create_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_model.dart';
import 'package:finance_app/app/features/setting/data/models/setting_update_model.dart';
import 'package:finance_app/app/features/setting/domain/entities/setting.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingRemoteDataSource settingRemoteDataSource;
  SettingRepositoryImpl({required this.settingRemoteDataSource});

  @override
  Future<Either<Failure, Setting>> createSetting(
      SettingCreate settingCreate) async {
    try {
      final SettingCreateModal settingCreateModel =
          SettingCreateModal.fromEntity(settingCreate);
      final SettingModal createdSetting =
          await settingRemoteDataSource.createSetting(settingCreateModel);
      //print(createdSetting);
      return Right(createdSetting.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, Setting>> deleteSetting(Setting setting) async {
    try {
      final SettingModal deletedSetting =
          await settingRemoteDataSource.deleteSetting(Setting as SettingModal);
      return Right(deletedSetting.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Setting>> getSetting(String id) async {
    try {
      final SettingModal setting = await settingRemoteDataSource.getSetting(id);
      return Right(setting.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Setting>>> getSettings() async {
    try {
      final List<SettingModal> settings =
          await settingRemoteDataSource.getSettings();
      final List<Setting> settingsList =
          settings.map((setting) => setting.toEntity()).toList();
      return Right(settingsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Setting>> updateSetting(
      SettingUpdate settingUpdate) async {
    try {
      /* final SettingModel updatedSetting =
          await SettingRemoteDataSource.updateSetting(Setting as SettingModel);
      return Right(updatedSetting.toEntity()); */

      final SettingUpdateModal settingUpdateModel =
          SettingUpdateModal.fromEntity(settingUpdate);
      final SettingModal updatedSetting =
          await settingRemoteDataSource.updateSetting(settingUpdateModel);
      return Right(updatedSetting.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
