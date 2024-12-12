import 'dart:convert';

import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/governorate/data/datasources/governorate_remote_data_source.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_create_model.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_model.dart';
import 'package:vendor_registration/app/features/governorate/data/models/governorate_update_model.dart';

class GovernorateRemoteDataSourceImpl implements GovernorateRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;
  GovernorateRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<GovernorateModel> createGovernorate(GovernorateCreateModel governorateCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.createGovernorate,
      data: governorateCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return GovernorateModel.fromJson(responseBody);
  }

  @override
  Future<GovernorateModel> deleteGovernorate(GovernorateModel governorateModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${ApiUrls.governorate}/${governorateModel.id}',
      data: governorateModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return GovernorateModel.fromJson(responseBody);
  }

  @override
  Future<GovernorateModel> getGovernorate(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${ApiUrls.getGovernorate}?id=$id',
    );

    final responseBody = json.decode(response.body);
    return GovernorateModel.fromJson(responseBody);
  }

  @override
  Future<List<GovernorateModel>> getGovernorates() async {
    final response = await httpClientWithInterceptor.get(
      ApiUrls.governorate,
    );

    final responseBody = json.decode(response.body);
    final List<GovernorateModel> governorates =
        (responseBody as List).map((governorate) => GovernorateModel.fromJson(governorate)).toList();
    return governorates;
  }

  @override
  Future<GovernorateModel> updateGovernorate(GovernorateUpdateModel governorateUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.updateGovernorate,
      data: governorateUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return GovernorateModel.fromJson(responseBody);
  }
}
