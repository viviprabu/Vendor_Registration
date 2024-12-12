import 'package:equatable/equatable.dart';


class Governorate extends Equatable {
  final String? id;
     final String? nameAr;
  final String? nameEn;
  
    bool isSelected = false;


  Governorate(
      {this.id,
      this.nameAr,
      this.nameEn,
      
     });

  @override
  List<Object?> get props => [
        id,
        nameAr,
        nameEn,
       
        
      ];
}
