import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_create.dart';

class InitialRequestCreateModal extends InitialRequestCreate {
  const InitialRequestCreateModal({
    /* required sectorId,
    required deptId, */
    required requestNumber,
    required requestDate,
    required estimatedAmount,
    required yearFrom,
    required yearTo,
    required cdRepContact,
    required subject,
    required documentFees,
    required uploadDocument,
  });

  factory InitialRequestCreateModal.fromJson(Map<String, dynamic> json) {
    return InitialRequestCreateModal(
      /* sectorId: json["sectorId"] ?? "",
      deptId: json["deptId"] ?? "", */
      requestNumber: json["requestNumber"] ?? "",
      requestDate: json["requestDate"] ?? "",
      estimatedAmount: json["estimatedAmount"] ?? "",
      yearFrom: json["yearFrom"] ?? "",
      yearTo: json["yearTo"] ?? "",
      cdRepContact: json["cdRepContact"] ?? "",
      subject: json["subject"] ?? "",
      documentFees: json["documentFees"] ?? "",
      uploadDocument: json["documentFees"] ?? "",
    );
  }

  /// have to send as a form data
  Map<String, dynamic> toFormData() {
    return {
      /* "sectorId": sectorId,
      "deptId": deptId, */
      "requestNumber": requestNumber,
      "requestDate": requestDate,
      "estimatedAmount": estimatedAmount,
      "yearFrom": yearFrom,
      "yearTo": yearTo,
      "cdRepContact": cdRepContact,
      "subject": subject,
      "documentFees": documentFees,
      "uploadDocument": uploadDocument,
    };
  }

  Map<String, dynamic> toJson() => {
        /* "sectorId": sectorId,
        "deptId": deptId, */
        "requestNumber": requestNumber,
        "requestDate": requestDate,
        "estimatedAmount": estimatedAmount,
        "yearFrom": yearFrom,
        "yearTo": yearTo,
        "cdRepContact": cdRepContact,
        "subject": subject,
        "documentFees": documentFees,
        "uploadDocument": uploadDocument,
      };

  factory InitialRequestCreateModal.fromEntity(
      InitialRequestCreate initialRequestCreate) {
    return InitialRequestCreateModal(
      /* sectorId: initialRequestCreate.sectorId,
      deptId: initialRequestCreate.deptId, */
      requestNumber: initialRequestCreate.requestNumber,
      requestDate: initialRequestCreate.requestDate,
      estimatedAmount: initialRequestCreate.estimatedAmount,
      yearFrom: initialRequestCreate.yearFrom,
      yearTo: initialRequestCreate.yearTo,
      cdRepContact: initialRequestCreate.cdRepContact,
      subject: initialRequestCreate.subject,
      documentFees: initialRequestCreate.documentFees,
      uploadDocument: initialRequestCreate.uploadDocument,
    );
  }

  InitialRequestCreate toEntity() {
    return InitialRequestCreate(
      /* sectorId: sectorId,
      deptId: deptId, */
      requestNumber: requestNumber,
      requestDate: requestDate,
      estimatedAmount: estimatedAmount,
      yearFrom: yearFrom,
      yearTo: yearTo,
      cdRepContact: cdRepContact,
      subject: subject,
      documentFees: documentFees,
      uploadDocument: uploadDocument,
    );
  }
}
