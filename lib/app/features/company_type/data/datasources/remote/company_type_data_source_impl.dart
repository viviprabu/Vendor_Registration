import 'dart:convert';

import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/company_type/data/datasources/company_type_remote_data_source.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_create_model.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_model.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_update_model.dart';



class CompanyTypeRemoteDataSourceImpl implements CompanyTypeRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;
  CompanyTypeRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  @override
  Future<CompanyTypeModel> createCompanyType(CompanyTypeCreateModel companyTypeCreateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.createCompanyType,
      data: companyTypeCreateModel.toFormData(),
    );
    final responseBody = json.decode(response.body);
    return CompanyTypeModel.fromJson(responseBody);
  }

  @override
  Future<CompanyTypeModel> deleteCompanyType(CompanyTypeModel companyTypeModel) async {
    final response = await httpClientWithInterceptor.delete(
      '${ApiUrls.companyType}/${companyTypeModel.id}',
      data: companyTypeModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return CompanyTypeModel.fromJson(responseBody);
  }

  @override
  Future<CompanyTypeModel> getCompanyType(String id) async {
    final response = await httpClientWithInterceptor.get(
      '${ApiUrls.getCompanyType}?id=$id',
    );

    final responseBody = json.decode(response.body);
    return CompanyTypeModel.fromJson(responseBody);
  }

  @override
  Future<List<CompanyTypeModel>> getCompanyTypes() async {
    final response = await httpClientWithInterceptor.get(
      ApiUrls.companyType,
    );

    final responseBody = json.decode(response.body);
    final List<CompanyTypeModel> companyTypes =
        (responseBody as List).map((companyType) => CompanyTypeModel.fromJson(companyType)).toList();
    return companyTypes;
  }

  @override
  Future<CompanyTypeModel> updateCompanyType(CompanyTypeUpdateModel companyTypeUpdateModel) async {
    final response = await httpClientWithInterceptor.postFormData(
      ApiUrls.updateCompanyType,
      data: companyTypeUpdateModel.toFormData(),
    );

    final responseBody = json.decode(response.body);
    return CompanyTypeModel.fromJson(responseBody);
  }
}
