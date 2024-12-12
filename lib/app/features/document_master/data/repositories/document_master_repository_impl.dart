import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/document_master/data/datasources/document_master_remote_data_source.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_create_model.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_model.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_update_model.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_create.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_update.dart';
import 'package:vendor_registration/app/features/document_master/domain/repositories/document_master_repository.dart';

class DocumentMasterRepositoryImpl implements DocumentMasterRepository {
  final DocumentMasterRemoteDataSource documentMasterRemoteDataSource;
  DocumentMasterRepositoryImpl({required this.documentMasterRemoteDataSource});

  @override
  Future<Either<Failure, DocumentMaster>> createDocumentMaster(DocumentMasterCreate documentMasterCreate) async {
    try {
      final DocumentMasterCreateModel documentMasterCreateModel =
          DocumentMasterCreateModel.fromEntity(documentMasterCreate);
      final DocumentMasterModel createdDocumentMaster =
          await documentMasterRemoteDataSource.createDocumentMaster(documentMasterCreateModel);
      //print(createdDocumentMaster);
      return Right(createdDocumentMaster.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, DocumentMaster>> deleteDocumentMaster(DocumentMaster documentMaster) async {
    try {
      final DocumentMasterModel deletedDocumentMaster =
          await documentMasterRemoteDataSource.deleteDocumentMaster(documentMaster as DocumentMasterModel);
      return Right(deletedDocumentMaster.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DocumentMaster>> getDocumentMaster(String id) async {
    try {
      final DocumentMasterModel documentMaster = await documentMasterRemoteDataSource.getDocumentMaster(id);
      return Right(documentMaster.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DocumentMaster>>> getDocumentMasters() async {
    try {
      final List<DocumentMasterModel> documentMasters = await documentMasterRemoteDataSource.getDocumentMasters();
      final List<DocumentMaster> documentMastersList =
          documentMasters.map((documentMaster) => documentMaster.toEntity()).toList();
      return Right(documentMastersList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DocumentMaster>> updateDocumentMaster(DocumentMasterUpdate documentMasterUpdate) async {
    try {
      /* final DocumentMasterModel updatedDocumentMaster =
          await DocumentMasterRemoteDataSource.updateDocumentMaster(DocumentMaster as DocumentMasterModel);
      return Right(updatedDocumentMaster.toEntity()); */

      final DocumentMasterUpdateModel documentMasterUpdateModel =
          DocumentMasterUpdateModel.fromEntity(documentMasterUpdate);
      final DocumentMasterModel updatedDocumentMaster =
          await documentMasterRemoteDataSource.updateDocumentMaster(documentMasterUpdateModel);
      return Right(updatedDocumentMaster.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
