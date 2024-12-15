import 'package:vendor_registration/app/features/area/domain/entities/area_update.dart';

class AreaUpdateModel extends AreaUpdate {
  const AreaUpdateModel({
    required super.nameAr,
    required super.nameEn,
       required super.governorateId,


   
  });

  factory AreaUpdateModel.fromJson(Map<String, dynamic> json) {
    return AreaUpdateModel(
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      governorateId: json["governorateId"] ?? "",
     
    );
  }

  // have to send as a form data

  Map<String, dynamic> toFormData() {
    return {
      "nameAr": nameAr,
      "nameEn": nameEn,
      "governorateId":governorateId,
      
      
    };
  }

  Map<String, dynamic> toJson() => {
          "nameAr": nameAr,
      "nameEn": nameEn,
      "governorateId":governorateId,
      
      };

  // fromEninty
  factory AreaUpdateModel.fromEntity(AreaUpdate areaUpdate) {
    return AreaUpdateModel(
      nameAr: areaUpdate.nameAr,
      nameEn: areaUpdate.nameEn,
      governorateId:areaUpdate.governorateId,
     
    );
  }

  // toEntity
  AreaUpdate toEntity() {
    return AreaUpdate(
      nameAr: nameAr,
      nameEn: nameEn,
      governorateId:governorateId
    
     
    );
  }
}
