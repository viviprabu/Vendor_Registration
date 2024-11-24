import 'package:equatable/equatable.dart';

class InitialRequestCreate extends Equatable {
  final String? id;
  final String? sectorId;
  final String? deptId;
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

  const InitialRequestCreate(
      {this.id,
      this.sectorId,
      this.deptId,
      this.requestNumber,
      this.requestDate,
      this.estimatedAmount,
      this.yearFrom,
      this.yearTo,
      this.cdRepContact,
      this.subject,
      this.documentFees,
      this.uploadDocument,
      this.state,
      this.nextStep});

  @override
  List<Object?> get props => [
        id,
        sectorId,
        deptId,
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
