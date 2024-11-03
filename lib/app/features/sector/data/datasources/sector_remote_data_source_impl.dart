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
  Future<SectorModal> createSector(SectorModal sectorModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.post(
      '$applicationId/${ApiUrls.createUpdateSector}',
      data: sectorModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }

  @override
  Future<SectorModal> deleteSector(SectorModal sectorModel) {
    // TODO: implement deleteSector
    throw UnimplementedError();
  }

  @override
  Future<SectorModal> getSector(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.getSector}/$id',
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
    var applicationId = '0';
    final response = await httpClient.get(
      '$applicationId/${ApiUrls.listSectors}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final responseBody = json.decode(response.body);
    final List<SectorModal> sectors = (responseBody as List)
        .map((user) => SectorModal.fromJson(user))
        .toList();
    return sectors;
  }

  @override
  Future<SectorModal> updateSector(SectorModal sectorModel) {
    // TODO: implement updateSector
    throw UnimplementedError();
  }
}
