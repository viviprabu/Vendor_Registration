import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_update.dart';

class GovernorateUpdateModel extends GovernorateUpdate {
  const GovernorateUpdateModel({
    required super.nameAr,
    required super.nameEn,

   
  });

  factory GovernorateUpdateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateUpdateModel(
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
  factory GovernorateUpdateModel.fromEntity(GovernorateUpdate governorateUpdate) {
    return GovernorateUpdateModel(
      nameAr: governorateUpdate.nameAr,
      nameEn: governorateUpdate.nameEn,
     
    );
  }

  // toEntity
  GovernorateUpdate toEntity() {
    return GovernorateUpdate(
      nameAr: nameAr,
      nameEn: nameEn,
    
     
    );
  }
}
