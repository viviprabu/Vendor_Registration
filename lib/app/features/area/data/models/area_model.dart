



import 'package:vendor_registration/app/features/area/domain/entities/area.dart';

class AreaModel {
  final String? id;
  final String? nameAr;
  final String? nameEn;
  final String? governorateId;
 
  

  AreaModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.governorateId,
  
   
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json["id"] ?? "",
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      governorateId: json["governorateId"] ?? "",
     
     
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "governorateId": governorateId
       
       
      };

  factory AreaModel.fromEntity(Area area) {
    return AreaModel(
        id: area.id,
        nameAr: area.nameAr,
        nameEn: area.nameEn,
        governorateId:area.governorateId
       
       );
  }

  Area toEntity() {
    return Area(
        id: id,
        nameAr: nameAr,
        nameEn: nameEn,
        governorateId: governorateId,
        
       );
  }
}
