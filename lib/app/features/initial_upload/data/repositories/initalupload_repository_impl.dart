import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/data/datasources/initialupload_remote_data_source.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initialupload_create_model.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initialupload_model.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initialupload_update_model.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload_create.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload_update.dart';
import 'package:finance_app/app/features/initial_upload/domain/repositories/initialUpload_repository.dart';

class InitialUploadRepositoryImpl implements InitialUploadRepository {
  final InitialUploadRemoteDataSource initialUploadRemoteDataSource;
  InitialUploadRepositoryImpl({required this.initialUploadRemoteDataSource});

  @override
  Future<Either<Failure, InitialUpload>> createInitialUpload(
      InitialUploadCreate initialUploadCreate) async {
    try {
      final InitialUploadCreateModal initialUploadCreateModel =
          InitialUploadCreateModal.fromEntity(initialUploadCreate);
      final InitialUploadModal createdInitialUpload =
          await initialUploadRemoteDataSource
              .createInitialUpload(initialUploadCreateModel);
      //print(createdInitialUpload);
      return Right(createdInitialUpload.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, InitialUpload>> deleteInitialUpload(
      InitialUpload initialUpload) async {
    try {
      final InitialUploadModal deletedInitialUpload =
          await initialUploadRemoteDataSource
              .deleteInitialUpload(initialUpload as InitialUploadModal);
      return Right(deletedInitialUpload.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InitialUpload>> getInitialUpload(String id) async {
    try {
      final InitialUploadModal initialUpload =
          await initialUploadRemoteDataSource.getInitialUpload(id);
      return Right(initialUpload.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InitialUpload>>> getInitialUploads() async {
    try {
      final List<InitialUploadModal> initialUploads =
          await initialUploadRemoteDataSource.getInitialUploads();
      final List<InitialUpload> initialUploadsList = initialUploads
          .map((initialUpload) => initialUpload.toEntity())
          .toList();
      return Right(initialUploadsList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InitialUpload>> updateInitialUpload(
      InitialUploadUpdate initialUploadUpdate) async {
    try {
      /* final InitialUploadModel updatedInitialUpload =
          await InitialUploadRemoteDataSource.updateInitialUpload(InitialUpload as InitialUploadModel);
      return Right(updatedInitialUpload.toEntity()); */

      final InitialUploadUpdateModal initialUploadUpdateModel =
          InitialUploadUpdateModal.fromEntity(initialUploadUpdate);
      final InitialUploadModal updatedInitialUpload =
          await initialUploadRemoteDataSource
              .updateInitialUpload(initialUploadUpdateModel);
      return Right(updatedInitialUpload.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
