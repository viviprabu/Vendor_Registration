import 'dart:convert';
import 'package:finance_app/app/core/app_config/app_config.dart';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/section/data/datasources/section_remote_data_source.dart';
import 'package:finance_app/app/features/section/data/models/sections_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SectionRemoteDataSourceImpl implements SectionRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  SectionRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<SectionModal> deleteSection(SectionModal sectionModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${AppConfig.applicationId}/${ApiUrls.section}/${sectionModel.id}',
      data: sectionModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }

  @override
  Future<SectionModal> getSection(int id) async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.getSection}?id=$id',
      //ApiUrls.userProfile,
    );

    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }

  @override
  Future<List<SectionModal>> getSections() async {
    final response = await httpClientWithInterceptor.get(
      '${AppConfig.applicationId}/${ApiUrls.section}',
    );

    final responseBody = json.decode(response.body);
    final List<SectionModal> dept = (responseBody as List)
        .map((dept) => SectionModal.fromJson(dept))
        .toList();

    return dept;
  }

  @override
  Future<SectionModal> updateSection(SectionModal sectionModel) async {
    final response = await httpClientWithInterceptor.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      '${AppConfig.applicationId}/${ApiUrls.updateSection}',
      data: sectionModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }

  @override
  Future<SectionModal> createSection(SectionModal sectionModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      '${AppConfig.applicationId}/${ApiUrls.createSection}',
      data: sectionModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }
}
