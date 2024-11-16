import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/domain/repositories/initialUpload_repository.dart';

class DeleteInitialUpload {
  final InitialUploadRepository initialUploadRepository;

  DeleteInitialUpload(this.initialUploadRepository);

  Future<Either<Failure, InitialUpload>> call(
      InitialUpload initialUpload) async {
    return await initialUploadRepository.deleteInitialUpload(initialUpload);
  }
}
