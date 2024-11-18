import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_create.dart';
import 'package:finance_app/app/features/initial_upload/domain/entities/initial_upload_update.dart';

abstract class InitialUploadEvent extends Equatable {
  const InitialUploadEvent();

  @override
  List<Object> get props => [];
}

class InitialUploadInitialEvent extends InitialUploadEvent {}

class InitialUploadsListEvent extends InitialUploadEvent {}

class InitialUploadCreateEvent extends InitialUploadEvent {
  final InitialUploadCreate initialUploadCreate;
  const InitialUploadCreateEvent(this.initialUploadCreate);

  @override
  List<Object> get props => [initialUploadCreate];
}

class InitialUploadUpdateEvent extends InitialUploadEvent {
  final InitialUploadUpdate initialUploadUpdate;
  const InitialUploadUpdateEvent(this.initialUploadUpdate);

  @override
  List<Object> get props => [initialUploadUpdate];
}

class InitialUploadDeleteEvent extends InitialUploadEvent {
  final InitialUpload initialUpload;
  const InitialUploadDeleteEvent(this.initialUpload);

  @override
  List<Object> get props => [initialUpload];
}

class InitialUploadListEvent extends InitialUploadEvent {
  final String id;
  const InitialUploadListEvent(this.id);

  @override
  List<Object> get props => [id];
}
