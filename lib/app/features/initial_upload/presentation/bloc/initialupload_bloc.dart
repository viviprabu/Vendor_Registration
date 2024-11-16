import 'package:finance_app/app/features/initial_upload/domain/usecases/create_initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/domain/usecases/delete_initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/domain/usecases/get_initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/domain/usecases/get_initialUploads.dart';
import 'package:finance_app/app/features/initial_upload/domain/usecases/update_initialUpload.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_event.dart';
import 'package:finance_app/app/features/initial_upload/presentation/bloc/initialupload_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialUploadBloc extends Bloc<InitialUploadEvent, InitialUploadState> {
  GetInitialUpload getInitialUpload;
  GetInitialUploads getInitialUploads;
  CreateInitialUpload createInitialUpload;
  UpdateInitialUpload updateInitialUpload;
  DeleteInitialUpload deleteInitialUpload;

  InitialUploadBloc({
    required this.getInitialUpload,
    required this.getInitialUploads,
    required this.createInitialUpload,
    required this.updateInitialUpload,
    required this.deleteInitialUpload,
  }) : super(InitialUploadInitial()) {
    on<InitialUploadListEvent>((event, emit) async {
      emit(InitialUploadLoadingState());
      final failureOrInitialUpload = await getInitialUpload(event.id);
      failureOrInitialUpload.fold(
        (failure) => emit(InitialUploadError(failure.toString())),
        (initialUpload) => emit(InitialUploadListState(initialUpload)),
      );
    });

    on<InitialUploadsListEvent>((event, emit) async {
      emit(InitialUploadLoadingState());
      final failureOrInitialUploads = await getInitialUploads();
      failureOrInitialUploads.fold(
        (failure) => emit(InitialUploadError(failure.toString())),
        (initialUploads) => emit(InitialUploadsListState(initialUploads)),
      );
    });

    on<InitialUploadCreateEvent>((event, emit) async {
      emit(InitialUploadLoadingState());
      final failureOrInitialUpload =
          await createInitialUpload(event.initialUploadCreate);
      failureOrInitialUpload.fold(
        (failure) => emit(InitialUploadError(failure.toString())),
        (initialUpload) => emit(InitialUploadCreateState(initialUpload)),
      );
    });

    on<InitialUploadUpdateEvent>((event, emit) async {
      emit(InitialUploadLoadingState());
      final failureOrInitialUpload =
          await updateInitialUpload(event.initialUploadUpdate);
      failureOrInitialUpload.fold(
        (failure) => emit(InitialUploadError(failure.toString())),
        (initialUpload) => emit(InitialUploadUpdateState(initialUpload)),
      );
    });

    on<InitialUploadDeleteEvent>((event, emit) async {
      emit(InitialUploadLoadingState());
      final failureOrInitialUpload =
          await deleteInitialUpload(event.initialUpload);
      failureOrInitialUpload.fold(
        (failure) => emit(InitialUploadError(failure.toString())),
        (initialUpload) => emit(InitialUploadDeleteState(initialUpload)),
      );
    });

    on<InitialUploadInitialEvent>((event, emit) {
      emit(InitialUploadInitial());
    });
  }
}
