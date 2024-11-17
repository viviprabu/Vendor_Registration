import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/domain/repositories/initial_upload_repository.dart';

class GetInitialUploads {
  final InitialUploadRepository repository;

  GetInitialUploads(this.repository);

  Future<Either<Failure, List<InitialUpload>>> call() async {
    return await repository.getInitialUploads();
  }
}
