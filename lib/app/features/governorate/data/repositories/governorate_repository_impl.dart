import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/governorate/data/datasources/governorate_remote_data_source.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_create_model.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_model.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_update_model.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_create.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_update.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';


class GovernorateRepositoryImpl implements GovernorateRepository {
  final GovernorateRemoteDataSource governorateRemoteDataSource;
  GovernorateRepositoryImpl({required this.governorateRemoteDataSource});

  @override
  Future<Either<Failure, Governorate>> createGovernorate(GovernorateCreate governorateCreate) async {
    try {
      final GovernorateCreateModel governorateCreateModel =
          GovernorateCreateModel.fromEntity(governorateCreate);
      final GovernorateModel createdGovernorate =
          await governorateRemoteDataSource.createGovernorate(governorateCreateModel);
      //print(createdGovernorate);
      return Right(createdGovernorate.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, Governorate>> deleteGovernorate(Governorate governorate) async {
    try {
      final GovernorateModel deletedGovernorate =
          await governorateRemoteDataSource.deleteGovernorate(governorate as GovernorateModel);
      return Right(deletedGovernorate.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Governorate>> getGovernorate(String id) async {
    try {
      final GovernorateModel governorate = await governorateRemoteDataSource.getGovernorate(id);
      return Right(governorate.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    try {
      final List<GovernorateModel> governorates = await governorateRemoteDataSource.getGovernorates();
      final List<Governorate> governoratesList =
          governorates.map((governorate) => governorate.toEntity()).toList();
      return Right(governoratesList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Governorate>> updateGovernorate(GovernorateUpdate governorateUpdate) async {
    try {
      /* final GovernorateModel updatedGovernorate =
          await GovernorateRemoteDataSource.updateGovernorate(Governorate as GovernorateModel);
      return Right(updatedGovernorate.toEntity()); */

      final GovernorateUpdateModel governorateUpdateModel =
          GovernorateUpdateModel.fromEntity(governorateUpdate);
      final GovernorateModel updatedGovernorate =
          await governorateRemoteDataSource.updateGovernorate(governorateUpdateModel);
      return Right(updatedGovernorate.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
