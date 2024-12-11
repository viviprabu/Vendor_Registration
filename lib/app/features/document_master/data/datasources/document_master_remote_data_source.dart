

import 'package:vendor_registration/app/features/document_master/data/models/document_master_create_model.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_model.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_update_model.dart';

abstract interface class DocumentMasterRemoteDataSource {
  Future<DocumentMasterModel> getDocumentMaster(String id);
  Future<DocumentMasterModel> updateDocumentMaster(DocumentMasterUpdateModel documentMasterUpdateModel);
  Future<DocumentMasterModel> deleteDocumentMaster(DocumentMasterModel documentMasterModel);
  Future<DocumentMasterModel> createDocumentMaster(DocumentMasterCreateModel documentMasterCreateModel);
  Future<List<DocumentMasterModel>> getDocumentMasters();
}
