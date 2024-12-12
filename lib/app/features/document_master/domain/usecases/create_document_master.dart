import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_create.dart';
import 'package:vendor_registration/app/features/document_master/domain/repositories/document_master_repository.dart';

class CreateDocumentMaster {
  final DocumentMasterRepository documentMasterRepository;

  CreateDocumentMaster(this.documentMasterRepository);

  Future<Either<Failure, DocumentMaster>> call(DocumentMasterCreate documentMasterCreate) async {
    return await documentMasterRepository.createDocumentMaster(documentMasterCreate);
  }
}
