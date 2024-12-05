import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';

class RegistrationModal {
  final int? id;
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
  final String? contactName;
  final String? companyCivilId;
  final int? documentId;
  final String? documentName;
  final DateTime? expireDate;

  RegistrationModal(
      {required this.id,
      required this.fullName,
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
      required this.contactName,
      required this.companyCivilId,
      required this.documentId,
      required this.documentName,
      required this.expireDate});

  factory RegistrationModal.fromJson(Map<String, dynamic> json) {
    return RegistrationModal(
      id: json["id"] ?? "",
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
      contactName: json["contactName"] ?? "",
      companyCivilId: json["companyCivilId"] ?? "",
      documentId: json["id"] ?? "",
      documentName: json["documentName"] ?? "",
      expireDate: json["expireDate"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "password": password,
        "mobileNumber": mobileNumber,
        "civilId": civilId,
        "companyId": companyId,
        "companyName": companyNameEnglish,
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
        "contactName":contactName,
        "companyCivilId": companyCivilId,
        "documentId": documentId,
        "documentName": documentName,
        "expireDate": expireDate,
      };

  factory RegistrationModal.fromEntity(Registration registration) {
    return RegistrationModal(
      id: registration.id,
      fullName: registration.fullName,
      email: registration.email,
      password: registration.password,
      mobileNumber: registration.mobileNumber,
      civilId: registration.civilId,
      companyId: registration.companyId,
      companyNameEnglish: registration.companyNameEnglish,
      companyNameArabic: registration.companyNameArabic,
      address: registration.address,
      phoneNumber: registration.phoneNumber,
      fax: registration.fax,
      website: registration.website,
      postBox: registration.postBox,
      postalCode: registration.postalCode,
      postalArea: registration.postalArea,
      country: registration.country,
      governorate: registration.governorate,
      area: registration.area,
      block: registration.block,
      building: registration.building,
      street: registration.street,
      floor: registration.floor,
      office: registration.office,
      paci: registration.paci,
      companyType: registration.companyType,
      tradeApprovalNumber: registration.tradeApprovalNumber,
      dateStarted: registration.dateStarted,
      contactName: registration.contactName,
      companyCivilId: registration.companyCivilId,
      documentId: registration.documentId,
      documentName: registration.documentName,
      expireDate: registration.expireDate,
    );
  }

  Registration toEntity() {
    return Registration(
      id: id,
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
      contactName: contactName,
      companyCivilId: companyCivilId,
      documentId: documentId,
      documentName: documentName,
      expireDate: expireDate,
    );
  }
}
