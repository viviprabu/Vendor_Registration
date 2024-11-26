import 'package:equatable/equatable.dart';

class InitialRequestUpdate extends Equatable {
  final String? id;
  /* final int? sectorId;
  final int? deptId; */
  final String? requestNumber;
  final DateTime? requestDate;
  final String? estimatedAmount;
  final String? yearFrom;
  final String? yearTo;
  final String? cdRepContact;
  final String? subject;
  final String? documentFees;
  final String? uploadDocument;
  final String? state;
  final String? nextStep;

  const InitialRequestUpdate(
      {required this.id,
      /* required this.sectorId,
      required this.deptId, */
      required this.requestNumber,
      required this.requestDate,
      required this.estimatedAmount,
      required this.yearFrom,
      required this.yearTo,
      required this.cdRepContact,
      required this.subject,
      required this.documentFees,
      required this.uploadDocument,
      required this.state,
      required this.nextStep});

  @override
  List<Object?> get props => [
        id,
        /* sectorId,
        deptId, */
        requestNumber,
        requestDate,
        estimatedAmount,
        yearFrom,
        yearTo,
        cdRepContact,
        subject,
        documentFees,
        uploadDocument,
        state,
        nextStep
      ];
}
