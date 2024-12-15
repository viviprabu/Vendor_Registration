

import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_create.dart';

class CompanyTypeCreateModel extends CompanyTypeCreate {
  const CompanyTypeCreateModel(
      {required super.nameAr,
      required super.nameEn,
     
     
     });

  factory CompanyTypeCreateModel.fromJson(Map<String, dynamic> json) {
    return CompanyTypeCreateModel(
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
  
      
     
    );
  }

  /// have to send as a form data
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

  factory CompanyTypeCreateModel.fromEntity(CompanyTypeCreate companyTypeCreate) {
    return CompanyTypeCreateModel(
        nameAr: companyTypeCreate.nameAr,
        nameEn: companyTypeCreate.nameEn,

       
       );
  }

  CompanyTypeCreate toEntity() {
    return CompanyTypeCreate(
        nameAr: nameAr,
        nameEn: nameEn,
  
       
       );
  }
}
