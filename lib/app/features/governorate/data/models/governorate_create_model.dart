
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_create.dart';

class GovernorateCreateModel extends GovernorateCreate {
  const GovernorateCreateModel(
      {required super.nameAr,
      required super.nameEn,
     
     });

  factory GovernorateCreateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateCreateModel(
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

  factory GovernorateCreateModel.fromEntity(GovernorateCreate governorateCreate) {
    return GovernorateCreateModel(
        nameAr: governorateCreate.nameAr,
        nameEn: governorateCreate.nameEn,
       
       );
  }

  GovernorateCreate toEntity() {
    return GovernorateCreate(
        nameAr: nameAr,
        nameEn: nameEn,
       
       );
  }
}
