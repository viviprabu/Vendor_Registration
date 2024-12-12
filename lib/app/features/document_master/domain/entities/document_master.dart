import 'package:equatable/equatable.dart';


class DocumentMaster extends Equatable {
  final String? id;
     final String? nameAr;
  final String? nameEn;
  final bool? hasExpiryDate;
  final bool? isActive;
  final bool? isMandatory;
    bool isSelected = false;


  DocumentMaster(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.hasExpiryDate,
      this.isActive,
      this.isMandatory,
     });

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
        hasExpiryDate,
        isActive,
        isMandatory,
        
      ];
}
