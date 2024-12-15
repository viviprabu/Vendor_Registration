
import 'package:vendor_registration/app/features/area/domain/entities/area_create.dart';

class AreaCreateModel extends AreaCreate {
  const AreaCreateModel(
      {required super.nameAr,
      required super.nameEn,
      required super.governorateId,
     
     });

  factory AreaCreateModel.fromJson(Map<String, dynamic> json) {
    return AreaCreateModel(
      nameAr: json["nameAr"] ?? "",
      nameEn: json["nameEn"] ?? "",
      governorateId: json["governorateId"] ?? "",
      
     
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      "nameAr": nameAr,
      "nameEn": nameEn,
      "governorateId":governorateId
     
      
    };
  }

  Map<String, dynamic> toJson() => {
         "nameAr": nameAr,
      "nameEn": nameEn,
          "governorateId":governorateId
      
       
      };

  factory AreaCreateModel.fromEntity(AreaCreate areaCreate) {
    return AreaCreateModel(
        nameAr: areaCreate.nameAr,
        nameEn: areaCreate.nameEn,
        governorateId: areaCreate.governorateId,
       
       );
  }

  AreaCreate toEntity() {
    return AreaCreate(
        nameAr: nameAr,
        nameEn: nameEn,
        governorateId: governorateId,
       
       );
  }
}
