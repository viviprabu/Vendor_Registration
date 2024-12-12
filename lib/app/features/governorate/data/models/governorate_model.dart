


import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';

class GovernorateModel {
  final String? id;
  final String? nameAr;
  final String? nameEn;
 
  

  GovernorateModel({
    this.id,
    this.nameAr,
    this.nameEn,
  
   
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
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

  factory GovernorateModel.fromEntity(Governorate governorate) {
    return GovernorateModel(
        id: governorate.id,
        nameAr: governorate.nameAr,
        nameEn: governorate.nameEn,
       
       );
  }

  Governorate toEntity() {
    return Governorate(
        id: id,
        nameAr: nameAr,
        nameEn: nameEn,
        
       );
  }
}
