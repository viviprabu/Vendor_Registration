import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';

class InitialRequestModal extends InitialRequest {
  InitialRequestModal({
    required super.id,
    required sectorId,
    required deptId,
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

  factory InitialRequestModal.fromJson(Map<String, dynamic> json) {
    return InitialRequestModal(
      id: json["id"] ?? "",
      sectorId: json["sectorId"] ?? "",
      deptId: json["deptId"] ?? "",
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "sectorId": sectorId,
        "deptId": deptId,
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

  factory InitialRequestModal.fromEntity(InitialRequest initialRequest) {
    return InitialRequestModal(
      id: initialRequest.id,
      sectorId: initialRequest.sectorId,
      deptId: initialRequest.deptId,
      requestNumber: initialRequest.requestNumber,
      requestDate: initialRequest.requestDate,
      estimatedAmount: initialRequest.estimatedAmount,
      yearFrom: initialRequest.yearFrom,
      yearTo: initialRequest.yearTo,
      cdRepContact: initialRequest.cdRepContact,
      subject: initialRequest.subject,
      documentFees: initialRequest.documentFees,
      uploadDocument: initialRequest.uploadDocument,
    );
  }

  InitialRequest toEntity() {
    return InitialRequest(
      id: id,
      sectorId: sectorId,
      deptId: deptId,
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
