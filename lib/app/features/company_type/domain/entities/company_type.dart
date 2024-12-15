import 'package:equatable/equatable.dart';


// ignore: must_be_immutable
class CompanyType extends Equatable {
  final String? id;
     final String? nameAr;
  final String? nameEn;
  
  
    bool isSelected = false;


  CompanyType(
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
