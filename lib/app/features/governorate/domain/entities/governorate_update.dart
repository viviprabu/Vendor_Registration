import 'package:equatable/equatable.dart';

class GovernorateUpdate extends Equatable {
  final String? nameAr;
  final String? nameEn;
 

  const GovernorateUpdate({
    
    required this.nameAr,
      required this.nameEn,
     
  });

  @override
  List<Object?> get props => [
        
        nameAr,
        nameEn,
       
      ];
}
