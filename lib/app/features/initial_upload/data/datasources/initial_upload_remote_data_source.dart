import 'package:finance_app/app/features/initial_upload/data/models/initial_upload_create_model.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initial_upload_model.dart';
import 'package:finance_app/app/features/initial_upload/data/models/initial_upload_update_model.dart';

abstract interface class InitialUploadRemoteDataSource {
  Future<InitialUploadModal> getInitialUpload(String id);
  Future<InitialUploadModal> updateInitialUpload(
      InitialUploadUpdateModal initialUploadUpdateModel);
  Future<InitialUploadModal> deleteInitialUpload(
      InitialUploadModal initialUploadModel);
  Future<InitialUploadModal> createInitialUpload(
      InitialUploadCreateModal initialUploadCreateModel);
  Future<List<InitialUploadModal>> getInitialUploads();
}
