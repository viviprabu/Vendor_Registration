
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/repositories/document_master_repository.dart';

class DeleteDocumentMaster {
  final DocumentMasterRepository documentMasterRepository;

  DeleteDocumentMaster(this.documentMasterRepository);

  Future<Either<Failure, DocumentMaster>> call(DocumentMaster documentMaster) async {
    return await documentMasterRepository.deleteDocumentMaster(documentMaster);
  }
}
