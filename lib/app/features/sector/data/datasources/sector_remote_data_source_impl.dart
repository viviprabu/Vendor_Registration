import 'dart:convert';

import 'package:finance_app/app/core/constants/api_urls.dart';
import 'package:finance_app/app/core/network/http_client_with_interceptor.dart';
import 'package:finance_app/app/features/sector/data/datasources/sector_remote_data_source.dart';
import 'package:finance_app/app/features/sector/data/models/sector_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SectorRemoteDataSourceImpl implements SectorRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  SectorRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<SectorModal> createSector(SectorModal sectorModel) async {
    var applicationId = '1';
    final response = await httpClientWithInterceptor.post(
      '$applicationId/${ApiUrls.createUpdateSector}',
      data: sectorModel.toJson(),
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
    var applicationId = '1';
    final response = await httpClientWithInterceptor.get(
      '$applicationId/${ApiUrls.getSector}/$id',
    );
    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }

  @override
  Future<List<SectorModal>> getSectors() async {
    var applicationId = '1';
    final response = await httpClientWithInterceptor.get(
      '$applicationId/${ApiUrls.listSectors}',
    );

    final responseBody = json.decode(response.body);
    final List<SectorModal> sectors = (responseBody as List)
        .map((sector) => SectorModal.fromJson(sector))
        .toList();
    return sectors;
  }

  @override
  Future<SectorModal> updateSector(SectorModal sectorModel) async {
    var applicationId = '1';
    final response = await httpClientWithInterceptor.post(
      '$applicationId/${ApiUrls.createUpdateSector}',
      data: sectorModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return SectorModal.fromJson(responseBody);
  }
}
