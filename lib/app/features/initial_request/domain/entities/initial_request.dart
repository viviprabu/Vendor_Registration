import 'package:equatable/equatable.dart';

class InitialRequest extends Equatable {
  final String? id;
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

  bool isSelected = false;

  InitialRequest(
      {this.id,
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
