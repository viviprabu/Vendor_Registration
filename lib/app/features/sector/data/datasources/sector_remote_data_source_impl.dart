import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/sector/data/datasources/sector_remote_data_source.dart';
import 'package:finance_app/app/features/sector/data/models/sector_create_modal.dart';
import 'package:finance_app/app/features/sector/data/models/sector_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SectorRemoteDataSourceImpl implements SectorRemoteDataSource {
  final HttpClient httpClient;

  SectorRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<SectorModal> deleteSector(SectorModal sectorModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.delete(
      '${ApiUrls.sectors}/${sectorModel.id}',
      data: sectorModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }

  @override
  Future<SectorModal> getSector(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      '${ApiUrls.getSectors}?id=$id',
      //ApiUrls.userProfile,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }

  @override
  Future<List<SectorModal>> getSectors() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.get(
      ApiUrls.sectors,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<SectorModal> sectors = (responseBody as List)
        .map((sector) => SectorModal.fromJson(sector))
        .toList();
    return sectors;
  }

  @override
  Future<SectorModal> updateSector(SectorModal sectorModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      ApiUrls.updateUser,
      data: sectorModel.toJson(),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }

  @override
  Future<SectorModal> createSector(SectorCreateModal sectorCreateModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    final response = await httpClient.postFormData(
      ApiUrls.createSector,
      data: sectorCreateModel.toFormData(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }
}
