import 'package:equatable/equatable.dart';

class CompanyTypeCreate extends Equatable {
   final String? nameAr;
  final String? nameEn;
  

  const CompanyTypeCreate(
      {
      required this.nameAr,
      required this.nameEn,
      
     
     });

  @override
  List<Object?> get props => [
        nameAr,
        nameEn,
        
       
       
      ];
}
