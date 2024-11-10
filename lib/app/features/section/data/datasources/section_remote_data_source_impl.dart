import 'dart:convert';
import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/section/data/datasources/section_remote_data_source.dart';
import 'package:finance_app/app/features/section/data/models/sections_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SectionRemoteDataSourceImpl implements SectionRemoteDataSource {
  final HttpClient httpClient;

  SectionRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<SectionModal> deleteSection(SectionModal sectionModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.delete(
      '$applicationId/${ApiUrls.Section}/${sectionModel.id}',
      data: sectionModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }

  @override
  Future<SectionModal> getSection(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.getSection}?id=$id',
      //ApiUrls.userProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }

  @override
  Future<List<SectionModal>> getSections() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.Section}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<SectionModal> dept = (responseBody as List)
        .map((dept) => SectionModal.fromJson(dept))
        .toList();

    return dept;
  }

  @override
  Future<SectionModal> updateSection(SectionModal sectionModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      '$applicationId/${ApiUrls.updateSection}',
      data: sectionModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }

  @override
  Future<SectionModal> createSection(SectionModal sectionModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.postFormData(
      '$applicationId/${ApiUrls.createSection}',
      data: sectionModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return SectionModal.fromJson(responseBody);
  }
}
