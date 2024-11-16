import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/domain/repositories/initialUpload_repository.dart';

class GetInitialUpload {
  final InitialUploadRepository repository;

  GetInitialUpload(this.repository);

  Future<Either<Failure, InitialUpload>> call(String id) async {
    return await repository.getInitialUpload(id);
  }
}
