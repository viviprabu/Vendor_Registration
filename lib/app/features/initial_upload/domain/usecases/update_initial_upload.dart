import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_update.dart';
import 'package:finance_app/app/features/initial_upload/domain/repositories/initial_upload_repository.dart';

class UpdateInitialUpload {
  final InitialUploadRepository initialUploadRepository;

  UpdateInitialUpload(this.initialUploadRepository);

  Future<Either<Failure, InitialUpload>> call(
      InitialUploadUpdate initialUploadUpdate) async {
    return await initialUploadRepository
        .updateInitialUpload(initialUploadUpdate);
  }
}
