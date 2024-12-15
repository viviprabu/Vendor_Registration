import 'package:equatable/equatable.dart';

class CompanyTypeUpdate extends Equatable {
  final String? nameAr;
  final String? nameEn;
  
 

  const CompanyTypeUpdate({
    
    required this.nameAr,
      required this.nameEn,
      
     
  });

  @override
  List<Object?> get props => [
        
        nameAr,
        nameEn,
        
       
      ];
}
