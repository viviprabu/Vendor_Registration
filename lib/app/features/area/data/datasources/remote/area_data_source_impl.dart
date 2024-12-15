import 'dart:convert';

import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/area/data/datasources/area_remote_data_source.dart';
import 'package:vendor_registration/app/features/area/data/models/area_create_model.dart';
import 'package:vendor_registration/app/features/area/data/models/area_model.dart';
import 'package:vendor_registration/app/features/area/data/models/area_update_model.dart';


class AreaRemoteDataSourceImpl implements AreaRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;
  AreaRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<AreaModel> createArea(AreaCreateModel areaCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.createArea,
      data: areaCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return AreaModel.fromJson(responseBody);
  }

  @override
  Future<AreaModel> deleteArea(AreaModel areaModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${ApiUrls.area}/${areaModel.id}',
      data: areaModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return AreaModel.fromJson(responseBody);
  }

  @override
  Future<AreaModel> getArea(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${ApiUrls.getArea}?id=$id',
    );

    final responseBody = json.decode(response.body);
    return AreaModel.fromJson(responseBody);
  }

  @override
  Future<List<AreaModel>> getAreas() async {
    final response = await httpClientWithInterceptor.get(
      ApiUrls.area,
    );

    final responseBody = json.decode(response.body);
    final List<AreaModel> areas =
        (responseBody as List).map((Area) => AreaModel.fromJson(Area)).toList();
    return areas;
  }

  @override
  Future<AreaModel> updateArea(AreaUpdateModel areaUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.updateArea,
      data: areaUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return AreaModel.fromJson(responseBody);
  }
}
