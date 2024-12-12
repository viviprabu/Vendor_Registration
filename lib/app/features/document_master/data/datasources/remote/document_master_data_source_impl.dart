import 'dart:convert';

import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/document_master/data/datasources/document_master_remote_data_source.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_create_model.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_model.dart';
import 'package:vendor_registration/app/features/document_master/data/models/document_master_update_model.dart';

class DocumentMasterRemoteDataSourceImpl implements DocumentMasterRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;
  DocumentMasterRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<DocumentMasterModel> createDocumentMaster(DocumentMasterCreateModel documentMasterCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.createDocumentMaster,
      data: documentMasterCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return DocumentMasterModel.fromJson(responseBody);
  }

  @override
  Future<DocumentMasterModel> deleteDocumentMaster(DocumentMasterModel documentMasterModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${ApiUrls.documentMaster}/${documentMasterModel.id}',
      data: documentMasterModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return DocumentMasterModel.fromJson(responseBody);
  }

  @override
  Future<DocumentMasterModel> getDocumentMaster(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${ApiUrls.getDocumentMaster}?id=$id',
    );

    final responseBody = json.decode(response.body);
    return DocumentMasterModel.fromJson(responseBody);
  }

  @override
  Future<List<DocumentMasterModel>> getDocumentMasters() async {
    final response = await httpClientWithInterceptor.get(
      ApiUrls.documentMaster,
    );

    final responseBody = json.decode(response.body);
    final List<DocumentMasterModel> documentMasters =
        (responseBody as List).map((documentMaster) => DocumentMasterModel.fromJson(documentMaster)).toList();
    return documentMasters;
  }

  @override
  Future<DocumentMasterModel> updateDocumentMaster(DocumentMasterUpdateModel documentMasterUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.updateDocumentMaster,
      data: documentMasterUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return DocumentMasterModel.fromJson(responseBody);
  }
}
