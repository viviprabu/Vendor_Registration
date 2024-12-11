

import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';

class DocumentMasterModel {
  final String? id;
  final String? nameAr;
  final String? nameEn;
  final String? hasExpiryDate;
  final bool? isActive;
  final bool? isMandatory;
  

  DocumentMasterModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.hasExpiryDate,
    this.isActive,
    this.isMandatory,
   
  });

  factory DocumentMasterModel.fromJson(Map<String, dynamic> json) {
    return DocumentMasterModel(
      id: json["id"] ?? "",
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      hasExpiryDate: json["hasExpiryDate"] ?? "",
      isActive: json["isActive"] ?? false,
      isMandatory: json["isMandatory"] ?? "",
     
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "hasExpiryDate": hasExpiryDate,
        "isActive": isActive,
        "isMandatory": isMandatory,
       
      };

  factory DocumentMasterModel.fromEntity(DocumentMaster documentMaster) {
    return DocumentMasterModel(
        id: documentMaster.id,
        nameAr: documentMaster.nameAr,
        nameEn: documentMaster.nameEn,
        hasExpiryDate: documentMaster.hasExpiryDate,
        isActive: documentMaster.isActive,
        isMandatory: documentMaster.isMandatory,
       );
  }

  DocumentMaster toEntity() {
    return DocumentMaster(
        id: id,
        nameAr: nameAr,
        nameEn: nameEn,
        hasExpiryDate: hasExpiryDate,
        isActive: isActive,
        isMandatory: isMandatory,
       );
  }
}
