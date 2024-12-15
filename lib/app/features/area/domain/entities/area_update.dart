import 'package:equatable/equatable.dart';

class AreaUpdate extends Equatable {
  final String? nameAr;
  final String? nameEn;
  final int? governorateId;
 

  const AreaUpdate({
    
    required this.nameAr,
      required this.nameEn,
      required this.governorateId
     
  });

  @override
  List<Object?> get props => [
        
        nameAr,
        nameEn,
        governorateId
       
      ];
}
