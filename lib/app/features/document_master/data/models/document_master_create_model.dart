

import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_create.dart';

class DocumentMasterCreateModel extends DocumentMasterCreate {
  const DocumentMasterCreateModel(
      {required super.nameAr,
      required super.nameEn,
      required super.hasExpiryDate,
      required super.isActive,
      required super.isMandatory,
     });

  factory DocumentMasterCreateModel.fromJson(Map<String, dynamic> json) {
    return DocumentMasterCreateModel(
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      hasExpiryDate: json["hasExpiryDate"] ?? "",
      isActive: json["isActive"] ?? "",
      isMandatory: json["isMandatory"] ?? "",
     
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      "nameAr": nameAr,
      "nameEn": nameEn,
      "hasExpiryDate": hasExpiryDate,
      "isActive": isActive,
      "isMandatory": isMandatory,
      
    };
  }

  Map<String, dynamic> toJson() => {
         "nameAr": nameAr,
      "nameEn": nameEn,
      "hasExpiryDate": hasExpiryDate,
      "isActive": isActive,
      "isMandatory": isMandatory,
       
      };

  factory DocumentMasterCreateModel.fromEntity(DocumentMasterCreate documentMasterCreate) {
    return DocumentMasterCreateModel(
        nameAr: documentMasterCreate.nameAr,
        nameEn: documentMasterCreate.nameEn,
        hasExpiryDate: documentMasterCreate.hasExpiryDate,
        isActive: documentMasterCreate.isActive,
        isMandatory: documentMasterCreate.isMandatory,
       );
  }

  DocumentMasterCreate toEntity() {
    return DocumentMasterCreate(
        nameAr: nameAr,
        nameEn: nameEn,
        hasExpiryDate: hasExpiryDate,
        isActive: isActive,
        isMandatory: isMandatory,
       );
  }
}
