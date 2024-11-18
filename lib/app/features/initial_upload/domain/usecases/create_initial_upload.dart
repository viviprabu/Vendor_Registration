import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_create.dart';
import 'package:finance_app/app/features/initial_upload/domain/repositories/initial_upload_repository.dart';

class CreateInitialUpload {
  final InitialUploadRepository initialUploadRepository;

  CreateInitialUpload(this.initialUploadRepository);

  Future<Either<Failure, InitialUpload>> call(
      InitialUploadCreate initialUploadCreate) async {
    return await initialUploadRepository
        .createInitialUpload(initialUploadCreate);
  }
}
