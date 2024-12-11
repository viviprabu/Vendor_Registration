import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_create.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_update.dart';


abstract interface class DocumentMasterRepository {
  Future<Either<Failure, DocumentMaster>> getDocumentMaster(String id);
  Future<Either<Failure, DocumentMaster>> updateDocumentMaster(DocumentMasterUpdate documentMasterUpdate);
  Future<Either<Failure, DocumentMaster>> deleteDocumentMaster(DocumentMaster documentMaster);
  Future<Either<Failure, DocumentMaster>> createDocumentMaster(DocumentMasterCreate documentMasterCreate);
  Future<Either<Failure, List<DocumentMaster>>> getDocumentMasters();
}
