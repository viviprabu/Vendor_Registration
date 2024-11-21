import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_update.dart';

class InitialRequestUpdateModal extends InitialRequestUpdate {
  const InitialRequestUpdateModal(
      {required super.id,
      required super.requestNumber,
      required super.requestDate,
      required super.estimatedAmount,
      required super.yearFrom,
      required super.yearTo,
      required super.cdRepContact,
      required super.subject,
      required super.documentFees,
      required super.uploadDocument,
      required super.state,
      required super.nextStep});

  factory InitialRequestUpdateModal.fromJson(Map<String, dynamic> json) {
    return InitialRequestUpdateModal(
      id: json["id"] ?? "",
      requestNumber: json["requestNumber"] ?? "",
      requestDate: json["requestDate"] ?? "",
      estimatedAmount: json["estimatedAmount"] ?? "",
      yearFrom: json["yearFrom"] ?? "",
      yearTo: json["yearTo"] ?? "",
      cdRepContact: json["cdRepContact"] ?? "",
      subject: json["subject"] ?? "",
      documentFees: json["documentFees"] ?? "",
      uploadDocument: json["uploadDocument"] ?? "",
      state: json["state"] ?? "",
      nextStep: json["nextStep"] ?? "",
    );
  }

  // have to send as a form data

  Map<String, dynamic> toFormData() {
    return {
      "id": id,
      "requestNumber": requestNumber,
      "requestDate": requestDate,
      "estimatedAmount": estimatedAmount,
      "yearFrom": yearFrom,
      "yearTo": yearTo,
      "cdRepContact": cdRepContact,
      "subject": subject,
      "documentFees": documentFees,
      "uploadDocument": uploadDocument,
      "state": state,
      "nextStep": nextStep,
    };
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "requestNumber": requestNumber,
        "requestDate": requestDate,
        "estimatedAmount": estimatedAmount,
        "yearFrom": yearFrom,
        "yearTo": yearTo,
        "cdRepContact": cdRepContact,
        "subject": subject,
        "documentFees": documentFees,
        "uploadDocument": uploadDocument,
        "state": state,
        "nextStep": nextStep,
      };

  // fromEninty
  factory InitialRequestUpdateModal.fromEntity(
      InitialRequestUpdate initialRequestUpdate) {
    return InitialRequestUpdateModal(
      id: initialRequestUpdate.id,
      requestNumber: initialRequestUpdate.requestNumber,
      requestDate: initialRequestUpdate.requestDate,
      estimatedAmount: initialRequestUpdate.estimatedAmount,
      yearFrom: initialRequestUpdate.yearFrom,
      yearTo: initialRequestUpdate.yearTo,
      cdRepContact: initialRequestUpdate.cdRepContact,
      subject: initialRequestUpdate.subject,
      documentFees: initialRequestUpdate.documentFees,
      uploadDocument: initialRequestUpdate.uploadDocument,
      state: initialRequestUpdate.state,
      nextStep: initialRequestUpdate.nextStep,
    );
  }

  // toEntity
  InitialRequestUpdate toEntity() {
    return InitialRequestUpdate(
      id: id,
      requestNumber: requestNumber,
      requestDate: requestDate,
      estimatedAmount: estimatedAmount,
      yearFrom: yearFrom,
      yearTo: yearTo,
      cdRepContact: cdRepContact,
      subject: subject,
      documentFees: documentFees,
      uploadDocument: uploadDocument,
      state: state,
      nextStep: nextStep,
    );
  }
}
