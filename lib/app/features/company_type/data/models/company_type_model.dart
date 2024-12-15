





import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';

class CompanyTypeModel {
  final String? id;
  final String? nameAr;
  final String? nameEn;
   
  

  CompanyTypeModel({
    this.id,
    this.nameAr,
    this.nameEn,
    
  
   
  });

  factory CompanyTypeModel.fromJson(Map<String, dynamic> json) {
    return CompanyTypeModel(
      id: json["id"] ?? "",
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      
     
     
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameAr": nameAr,
        "nameEn": nameEn,
        
       
       
      };

  factory CompanyTypeModel.fromEntity(CompanyType companyType) {
    return CompanyTypeModel(
        id: companyType.id,
        nameAr: companyType.nameAr,
        nameEn: companyType.nameEn,
        
       
       );
  }

  CompanyType toEntity() {
    return CompanyType(
        id: id,
        nameAr: nameAr,
        nameEn: nameEn,
        
        
       );
  }
}
