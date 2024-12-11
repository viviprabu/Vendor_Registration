import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_update.dart';

class DocumentMasterUpdateModel extends DocumentMasterUpdate {
  const DocumentMasterUpdateModel({
    required super.nameAr,
    required super.nameEn,
    required super.hasExpiryDate,
    required super.isActive,
    required super.isMandatory,
   
  });

  factory DocumentMasterUpdateModel.fromJson(Map<String, dynamic> json) {
    return DocumentMasterUpdateModel(
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      hasExpiryDate: json["hasExpiryDate"] ?? "",
      isActive: json["isActive"] ?? false,
      isMandatory: json["isMandatory"] ?? "",
    );
  }

  // have to send as a form data

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

  // fromEninty
  factory DocumentMasterUpdateModel.fromEntity(DocumentMasterUpdate documentMasterUpdate) {
    return DocumentMasterUpdateModel(
      nameAr: documentMasterUpdate.nameAr,
      nameEn: documentMasterUpdate.nameEn,
      hasExpiryDate: documentMasterUpdate.hasExpiryDate,
      isActive: documentMasterUpdate.isActive,
      isMandatory: documentMasterUpdate.isMandatory,
     
    );
  }

  // toEntity
  DocumentMasterUpdate toEntity() {
    return DocumentMasterUpdate(
      nameAr: nameAr,
      nameEn: nameEn,
      hasExpiryDate: hasExpiryDate,
      isActive: isActive,
      isMandatory: isMandatory,
     
    );
  }
}
