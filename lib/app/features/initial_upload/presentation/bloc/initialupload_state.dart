import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initialUpload.dart';

abstract class InitialUploadState extends Equatable {
  const InitialUploadState();

  @override
  List<Object> get props => [];
}

class InitialUploadInitial extends InitialUploadState {}

class InitialUploadLoadingState extends InitialUploadState {}

class InitialUploadsListState extends InitialUploadState {
  final List<InitialUpload> initialUploads;
  const InitialUploadsListState(this.initialUploads);

  @override
  List<Object> get props => [initialUploads];
}

class InitialUploadCreateState extends InitialUploadState {
  final InitialUpload initialUpload;
  const InitialUploadCreateState(this.initialUpload);

  @override
  List<Object> get props => [initialUpload];
}

class InitialUploadUpdateState extends InitialUploadState {
  final InitialUpload initialUpload;
  const InitialUploadUpdateState(this.initialUpload);

  @override
  List<Object> get props => [initialUpload];
}

class InitialUploadDeleteState extends InitialUploadState {
  final InitialUpload initialUpload;
  const InitialUploadDeleteState(this.initialUpload);

  @override
  List<Object> get props => [initialUpload];
}

class InitialUploadListState extends InitialUploadState {
  final InitialUpload initialUpload;
  const InitialUploadListState(this.initialUpload);

  @override
  List<Object> get props => [initialUpload];
}

class InitialUploadError extends InitialUploadState {
  final String message;
  const InitialUploadError(this.message);

  @override
  List<Object> get props => [message];
}
