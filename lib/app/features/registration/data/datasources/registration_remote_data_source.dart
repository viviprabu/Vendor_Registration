import 'package:vendor_registration/app/features/registration/data/models/registration_modal.dart';

abstract interface class RegistrationRemoteDataSource {
  Future<RegistrationModal> getRegistration(int id);
  Future<RegistrationModal> updateRegistration(
      RegistrationModal registrationModel);
  Future<RegistrationModal> deleteRegistration(
      RegistrationModal registrationModel);
  Future<RegistrationModal> createRegistration(
      RegistrationModal registrationModel);
  Future<List<RegistrationModal>> getRegistrations();
}
