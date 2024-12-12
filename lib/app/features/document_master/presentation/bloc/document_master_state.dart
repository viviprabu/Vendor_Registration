part of 'document_master_bloc.dart';

abstract class DocumentMasterState extends Equatable {
  const DocumentMasterState();

  @override
  List<Object> get props => [];
}

class DocumentMasterInitial extends DocumentMasterState {}

class DocumentMasterLoading extends DocumentMasterState {}

class DocumentMastersListState extends DocumentMasterState {
  final List<DocumentMaster> documentMasters;
  const DocumentMastersListState(this.documentMasters);

  @override
  List<Object> get props => [documentMasters];
}

class DocumentMasterCreateState extends DocumentMasterState {
  final DocumentMaster documentMaster;
  const DocumentMasterCreateState(this.documentMaster);

  @override
  List<Object> get props => [documentMaster];
}

class DocumentMasterUpdateState extends DocumentMasterState {
  final DocumentMaster documentMaster;
  const DocumentMasterUpdateState(this.documentMaster);

  @override
  List<Object> get props => [DocumentMaster];
}

class DocumentMasterDeleteState extends DocumentMasterState {
  final DocumentMaster documentMaster;
  const DocumentMasterDeleteState(this.documentMaster);

  @override
  List<Object> get props => [DocumentMaster];
}

class DocumentMasterListState extends DocumentMasterState {
  final DocumentMaster documentMaster;
  const DocumentMasterListState(this.documentMaster);

  @override
  List<Object> get props => [DocumentMaster];
}

class DocumentMasterError extends DocumentMasterState {
  final String message;
  const DocumentMasterError(this.message);

  @override
  List<Object> get props => [message];
}
