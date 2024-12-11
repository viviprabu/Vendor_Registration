import 'package:equatable/equatable.dart';

class DocumentMasterCreate extends Equatable {
   final String? nameAr;
  final String? nameEn;
  final String? hasExpiryDate;
  final bool? isActive;
  final bool? isMandatory;

  const DocumentMasterCreate(
      {
      required this.nameAr,
      required this.nameEn,
      required this.hasExpiryDate,
      required this.isActive,
      required this.isMandatory,
     });

  @override
  List<Object?> get props => [
        nameAr,
        nameEn,
        hasExpiryDate,
        isActive,
        isMandatory,
       
      ];
}
