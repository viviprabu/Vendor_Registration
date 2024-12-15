import 'package:equatable/equatable.dart';


class Area extends Equatable {
  final String? id;
     final String? nameAr;
  final String? nameEn;
  final String? governorateId;
  
    bool isSelected = false;


  Area(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.governorateId
      
     });

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
       governorateId
        
      ];
}
