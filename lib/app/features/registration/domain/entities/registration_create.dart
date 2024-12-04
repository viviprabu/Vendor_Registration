import 'package:equatable/equatable.dart';

class RegistrationCreate extends Equatable {
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

  const RegistrationCreate(
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

  @override
  List<Object?> get props => [
        fullName,
        email,
        password,
        mobileNumber,
        civilId,
        companyId,
        companyNameEnglish,
        companyNameArabic,
        address,
        phoneNumber,
        fax,
        website,
        postBox,
        postalCode,
        postalArea,
        country,
        governorate,
        area,
        block,
        building,
        street,
        floor,
        office,
        paci,
        companyType,
        tradeApprovalNumber,
        dateStarted,
        companyCivilId,
        documentId,
        documentName,
        expireDate,
      ];
}
