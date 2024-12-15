

import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_update.dart';

class CompanyTypeUpdateModel extends CompanyTypeUpdate {
  const CompanyTypeUpdateModel({
    required super.nameAr,
    required super.nameEn,
       


   
  });

  factory CompanyTypeUpdateModel.fromJson(Map<String, dynamic> json) {
    return CompanyTypeUpdateModel(
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      
     
    );
  }

  // have to send as a form data

  Map<String, dynamic> toFormData() {
    return {
      "nameAr": nameAr,
      "nameEn": nameEn,
      
      
      
    };
  }

  Map<String, dynamic> toJson() => {
          "nameAr": nameAr,
      "nameEn": nameEn,
      
      
      };

  // fromEninty
  factory CompanyTypeUpdateModel.fromEntity(CompanyTypeUpdate companyTypeUpdate) {
    return CompanyTypeUpdateModel(
      nameAr: companyTypeUpdate.nameAr,
      nameEn: companyTypeUpdate.nameEn,
      
     
    );
  }

  // toEntity
  CompanyTypeUpdate toEntity() {
    return CompanyTypeUpdate(
      nameAr: nameAr,
      nameEn: nameEn,
      
    
     
    );
  }
}
