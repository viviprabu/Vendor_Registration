import 'package:vendor_registration/app/features/registration/domain/entities/registration_create.dart';

class RegistrationCreateModal {
  final String? fullName;
  final String? email;
  final String? password;
  final String? mobileNumber;
  final String? civilId;
  final int? companyId;
  final String? companyNameEnglish;
  final String? companyNameArabic;
  final String? address;
  final String? phoneNumber;
  final String? fax;
  final String? website;
  final String? postBox;
  final String? postalCode;
  final String? postalArea;
  final String? country;
  final String? governorate;
  final String? area;
  final String? block;
  final String? building;
  final String? street;
  final String? floor;
  final String? office;
  final String? paci;
  final String? companyType;
  final String? tradeApprovalNumber;
  final DateTime? dateStarted;
  final String? companyCivilId;
  final int? documentId;
  final String? documentName;
  final DateTime? expireDate;

  const RegistrationCreateModal(
      {required this.fullName,
      required this.email,
      required this.password,
      required this.mobileNumber,
      required this.civilId,
      required this.companyId,
      required this.companyNameEnglish,
      required this.companyNameArabic,
      required this.address,
      required this.phoneNumber,
      required this.fax,
      required this.website,
      required this.postBox,
      required this.postalCode,
      required this.postalArea,
      required this.country,
      required this.governorate,
      required this.area,
      required this.block,
      required this.building,
      required this.street,
      required this.floor,
      required this.office,
      required this.paci,
      required this.companyType,
      required this.tradeApprovalNumber,
      required this.dateStarted,
      required this.companyCivilId,
      required this.documentId,
      required this.documentName,
      required this.expireDate});

  factory RegistrationCreateModal.fromJson(Map<String, dynamic> json) {
    return RegistrationCreateModal(
      fullName: json["name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      mobileNumber: json["mobileNumber"] ?? "",
      civilId: json["civilId"] ?? "",
      companyId: json["id"] ?? "",
      companyNameEnglish: json["companyNameEnglish"] ?? "",
      companyNameArabic: json["companyNameArabic"] ?? "",
      address: json["address"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
      fax: json["fax"] ?? "",
      website: json["website"] ?? "",
      postBox: json["postBox"] ?? "",
      postalCode: json["postalCode"] ?? "",
      postalArea: json["postalArea"] ?? "",
      country: json["country"] ?? "",
      governorate: json["governorate"] ?? "",
      area: json["area"] ?? "",
      block: json["block"] ?? "",
      building: json["building"] ?? "",
      street: json["street"] ?? "",
      floor: json["floor"] ?? "",
      office: json["office"] ?? "",
      paci: json["paci"] ?? "",
      companyType: json["companyType"] ?? "",
      tradeApprovalNumber: json["tradeApprovalNumber"] ?? "",
      dateStarted: json["dateStarted"] ?? "",
      companyCivilId: json["companyCivilId"] ?? "",
      documentId: json["id"] ?? "",
      documentName: json["documentName"] ?? "",
      expireDate: json["expireDate"] ?? "",
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "mobileNumber": mobileNumber,
      "civilId": civilId,
      "companyId": companyId,
      "companyNameEnglish": companyNameEnglish,
      "companyNameArabic": companyNameArabic,
      "address": address,
      "phoneNumber": phoneNumber,
      "fax": fax,
      "website": website,
      "postBox": postBox,
      "postalCode": postalCode,
      "postalArea": postalArea,
      "country": country,
      "governorate": governorate,
      "area": area,
      "block": block,
      "building": building,
      "street": street,
      "floor": floor,
      "office": office,
      "paci": paci,
      "companyType": companyType,
      "tradeApprovalNumber": tradeApprovalNumber,
      "dateStarted": dateStarted,
      "companyCivilId": companyCivilId,
      "documentId": documentId,
      "documentName": documentName,
      "expireDate": expireDate,
    };
  }

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "password": password,
        "mobileNumber": mobileNumber,
        "civilId": civilId,
        "companyId": companyId,
        "companyNameEnglish": companyNameEnglish,
        "companyNameArabic": companyNameArabic,
        "address": address,
        "phoneNumber": phoneNumber,
        "fax": fax,
        "website": website,
        "postBox": postBox,
        "postalCode": postalCode,
        "postalArea": postalArea,
        "country": country,
        "governorate": governorate,
        "area": area,
        "block": block,
        "building": building,
        "street": street,
        "floor": floor,
        "office": office,
        "paci": paci,
        "companyType": companyType,
        "tradeApprovalNumber": tradeApprovalNumber,
        "dateStarted": dateStarted,
        "companyCivilId": companyCivilId,
        "documentId": documentId,
        "documentName": documentName,
        "expireDate": expireDate,
      };

  factory RegistrationCreateModal.fromEntity(
      RegistrationCreate registrationCreate) {
    return RegistrationCreateModal(
      fullName: registrationCreate.fullName,
      email: registrationCreate.email,
      password: registrationCreate.password,
      mobileNumber: registrationCreate.mobileNumber,
      civilId: registrationCreate.civilId,
      companyId: registrationCreate.companyId,
      companyNameEnglish: registrationCreate.companyNameEnglish,
      companyNameArabic: registrationCreate.companyNameArabic,
      address: registrationCreate.address,
      phoneNumber: registrationCreate.phoneNumber,
      fax: registrationCreate.fax,
      website: registrationCreate.website,
      postBox: registrationCreate.postBox,
      postalCode: registrationCreate.postalCode,
      postalArea: registrationCreate.postalArea,
      country: registrationCreate.country,
      governorate: registrationCreate.governorate,
      area: registrationCreate.area,
      block: registrationCreate.block,
      building: registrationCreate.building,
      street: registrationCreate.street,
      floor: registrationCreate.floor,
      office: registrationCreate.office,
      paci: registrationCreate.paci,
      companyType: registrationCreate.companyType,
      tradeApprovalNumber: registrationCreate.tradeApprovalNumber,
      dateStarted: registrationCreate.dateStarted,
      companyCivilId: registrationCreate.companyCivilId,
      documentId: registrationCreate.documentId,
      documentName: registrationCreate.documentName,
      expireDate: registrationCreate.expireDate,
    );
  }

  RegistrationCreate toEntity() {
    return RegistrationCreate(
      fullName: fullName,
      email: email,
      password: password,
      mobileNumber: mobileNumber,
      civilId: civilId,
      companyId: companyId,
      companyNameEnglish: companyNameEnglish,
      companyNameArabic: companyNameArabic,
      address: address,
      phoneNumber: phoneNumber,
      fax: fax,
      website: website,
      postBox: postBox,
      postalCode: postalCode,
      postalArea: postalArea,
      country: country,
      governorate: governorate,
      area: area,
      block: block,
      building: building,
      street: street,
      floor: floor,
      office: office,
      paci: paci,
      companyType: companyType,
      tradeApprovalNumber: tradeApprovalNumber,
      dateStarted: dateStarted,
      companyCivilId: companyCivilId,
      documentId: documentId,
      documentName: documentName,
      expireDate: expireDate,
    );
  }
}
