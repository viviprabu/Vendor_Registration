import 'package:equatable/equatable.dart';

class Registration extends Equatable {
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
  bool isSelected = false;

  Registration(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.mobileNumber,
      this.civilId,
      this.companyId,
      this.companyNameEnglish,
      this.companyNameArabic,
      this.address,
      this.phoneNumber,
      this.fax,
      this.website,
      this.postBox,
      this.postalCode,
      this.postalArea,
      this.country,
      this.governorate,
      this.area,
      this.block,
      this.building,
      this.street,
      this.floor,
      this.office,
      this.paci,
      this.companyType,
      this.tradeApprovalNumber,
      this.dateStarted,
      this.contactName,
      this.companyCivilId,
      this.documentId,
      this.documentName,
      this.expireDate});

  @override
  List<Object?> get props => [
        id,
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
        contactName,
        companyCivilId,
        documentId,
        documentName,
        expireDate
      ];
}
