import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_update.dart';
import 'package:vendor_registration/app/features/document_master/domain/repositories/document_master_repository.dart';

class UpdateDocumentMaster {
  final DocumentMasterRepository documentMasterRepository;

  UpdateDocumentMaster(this.documentMasterRepository);

  Future<Either<Failure, DocumentMaster>> call(DocumentMasterUpdate documentMasterUpdate) async {
    return await documentMasterRepository.updateDocumentMaster(documentMasterUpdate);
  }
}
