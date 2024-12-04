import 'dart:convert';
import 'package:vendor_registration/app/core/app_config/app_config.dart';
import 'package:vendor_registration/app/core/constants/api_urls.dart';
import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/registration_remote_data_source.dart';
import 'package:vendor_registration/app/features/registration/data/models/registration_modal.dart';

class RegistrationRemoteDataSourceImpl implements RegistrationRemoteDataSource {
  final HttpClientWithInterceptor httpClientWithInterceptor;

  RegistrationRemoteDataSourceImpl({required this.httpClientWithInterceptor});

  final applicationId = AppConfig.applicationId;

  @override
  Future<RegistrationModal> deleteRegistration(
      RegistrationModal registrationModel) async {
    final response = await httpClientWithInterceptor.delete(
      '$applicationId/${ApiUrls.registration}/${registrationModel.id}',
      data: registrationModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return RegistrationModal.fromJson(responseBody);
  }

  @override
  Future<RegistrationModal> getRegistration(int id) async {
    final response = await httpClientWithInterceptor.get(
      '$applicationId/${ApiUrls.getRegistration}?id=$id',
      //ApiUrls.userProfile,
    );

    final responseBody = json.decode(response.body);
    return RegistrationModal.fromJson(responseBody);
  }

  @override
  Future<List<RegistrationModal>> getRegistrations() async {
    final response = await httpClientWithInterceptor.get(
      '$applicationId/${ApiUrls.registration}',
    );

    final responseBody = json.decode(response.body);
    final List<RegistrationModal> registrations = (responseBody as List)
        .map((registration) => RegistrationModal.fromJson(registration))
        .toList();

    return registrations;
  }

  @override
  Future<RegistrationModal> updateRegistration(
      RegistrationModal registrationModel) async {
    final response = await httpClientWithInterceptor.put(
      //'${ApiUrls.updateUser}/${userModel.id}',
      '$applicationId/${ApiUrls.updateRegistration}',
      data: registrationModel.toJson(),
    );

    final responseBody = json.decode(response.body);
    return RegistrationModal.fromJson(responseBody);
  }

  @override
  Future<RegistrationModal> createRegistration(
      RegistrationModal deptModel) async {
    final response = await httpClientWithInterceptor.post(
      '$applicationId/${ApiUrls.createRegistration}',
      data: deptModel.toJson(),
    );
    final responseBody = json.decode(response.body);
    return RegistrationModal.fromJson(responseBody);
  }
}
