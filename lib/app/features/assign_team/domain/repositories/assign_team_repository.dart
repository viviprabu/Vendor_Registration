import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_create.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_update.dart';

abstract interface class InitialUploadRepository {
  Future<Either<Failure, InitialUpload>> getInitialUpload(String id);
  Future<Either<Failure, InitialUpload>> updateInitialUpload(
      InitialUploadUpdate initialUploadUpdate);
  Future<Either<Failure, InitialUpload>> deleteInitialUpload(
      InitialUpload initialUpload);
  Future<Either<Failure, InitialUpload>> createInitialUpload(
      InitialUploadCreate initialUploadCreate);
  Future<Either<Failure, List<InitialUpload>>> getInitialUploads();
}
