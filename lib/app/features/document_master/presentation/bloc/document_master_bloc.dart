
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_create.dart';
import 'package:vendor_registration/app/features/document_master/domain/entities/document_master_update.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/create_document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/delete_document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/get_document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/get_document_masters.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/update_document_master.dart';

part 'document_master_event.dart';
part 'document_master_state.dart';

class DocumentMasterBloc extends Bloc<DocumentMasterEvent, DocumentMasterState> {
  GetDocumentMaster getDocumentMaster;
  GetDocumentMasters getDocumentMasters;
  CreateDocumentMaster createDocumentMaster;
  UpdateDocumentMaster updateDocumentMaster;
  DeleteDocumentMaster deleteDocumentMaster;

  DocumentMasterBloc({
    required this.getDocumentMaster,
    required this.getDocumentMasters,
    required this.createDocumentMaster,
    required this.updateDocumentMaster,
    required this.deleteDocumentMaster,
  }) : super(DocumentMasterInitial()) {
    on<DocumentMasterListEvent>((event, emit) async {
      emit(DocumentMasterLoading());
      final failureOrDocumentMaster = await getDocumentMaster(event.id);
      failureOrDocumentMaster.fold(
        (failure) => emit(DocumentMasterError(failure.toString())),
        (documentMaster) => emit(DocumentMasterListState(documentMaster)),
      );
    });

    on<DocumentMastersListEvent>((event, emit) async {
      emit(DocumentMasterLoading());
      final failureOrDocumentMasters = await getDocumentMasters();
      failureOrDocumentMasters.fold(
        (failure) => emit(DocumentMasterError(failure.toString())),
        (documentMasters) => emit(DocumentMastersListState(documentMasters)),
      );
    });

    on<DocumentMasterCreateEvent>((event, emit) async {
      emit(DocumentMasterLoading());
      final failureOrDocumentMaster = await createDocumentMaster(event.documentMasterCreate);
      failureOrDocumentMaster.fold(
        (failure) => emit(DocumentMasterError(failure.toString())),
        (documentMaster) => emit(DocumentMasterCreateState(documentMaster)),
      );
    });

    on<DocumentMasterUpdateEvent>((event, emit) async {
      emit(DocumentMasterLoading());
      final failureOrDocumentMaster = await updateDocumentMaster(event.documentMasterUpdate);
      failureOrDocumentMaster.fold(
        (failure) => emit(DocumentMasterError(failure.toString())),
        (documentMaster) => emit(DocumentMasterUpdateState(documentMaster)),
      );
    });

    on<DocumentMasterDeleteEvent>((event, emit) async {
      emit(DocumentMasterLoading());
      final failureOrDocumentMaster = await deleteDocumentMaster(event.documentMaster);
      failureOrDocumentMaster.fold(
        (failure) => emit(DocumentMasterError(failure.toString())),
        (documentMaster) => emit(DocumentMasterDeleteState(documentMaster)),
      );
    });

    on<DocumentMasterInitialEvent>((event, emit) {
      emit(DocumentMasterInitial());
    });
  }
}
