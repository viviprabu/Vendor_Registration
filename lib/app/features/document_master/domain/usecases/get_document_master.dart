import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/repositories/document_master_repository.dart';

class GetDocumentMaster {
  final DocumentMasterRepository repository;

  GetDocumentMaster(this.repository);

  Future<Either<Failure, DocumentMaster>> call(String id) async {
    return await repository.getDocumentMaster(id);
  }
}
