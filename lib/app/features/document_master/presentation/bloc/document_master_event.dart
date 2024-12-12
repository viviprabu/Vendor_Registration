part of 'document_master_bloc.dart';

abstract class DocumentMasterEvent extends Equatable {
  const DocumentMasterEvent();

  @override
  List<Object> get props => [];
}

class DocumentMasterInitialEvent extends DocumentMasterEvent {}

class DocumentMastersListEvent extends DocumentMasterEvent {}

class DocumentMasterCreateEvent extends DocumentMasterEvent {
  final DocumentMasterCreate documentMasterCreate;
  const DocumentMasterCreateEvent(this.documentMasterCreate);

  @override
  List<Object> get props => [documentMasterCreate];
}

class DocumentMasterUpdateEvent extends DocumentMasterEvent {
  final DocumentMasterUpdate documentMasterUpdate;
  const DocumentMasterUpdateEvent(this.documentMasterUpdate);

  @override
  List<Object> get props => [documentMasterUpdate];
}

class DocumentMasterDeleteEvent extends DocumentMasterEvent {
  final DocumentMaster documentMaster;
  const DocumentMasterDeleteEvent(this.documentMaster);

  @override
  List<Object> get props => [documentMaster];
}

class DocumentMasterListEvent extends DocumentMasterEvent {
  final String id;
  const DocumentMasterListEvent(this.id);

  @override
  List<Object> get props => [id];
}
