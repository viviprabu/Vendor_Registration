import 'package:equatable/equatable.dart';

class GovernorateCreate extends Equatable {
   final String? nameAr;
  final String? nameEn;
 

  const GovernorateCreate(
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
