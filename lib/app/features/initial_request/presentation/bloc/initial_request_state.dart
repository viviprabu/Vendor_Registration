import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';

abstract class InitialRequestState extends Equatable {
  const InitialRequestState();

  @override
  List<Object> get props => [];
}

class InitialRequestInitial extends InitialRequestState {}

class InitialRequestLoadingState extends InitialRequestState {}

class InitialRequestsListState extends InitialRequestState {
  final List<InitialRequest> initialRequests;
  const InitialRequestsListState(this.initialRequests);

  @override
  List<Object> get props => [initialRequests];
}

class InitialRequestCreateState extends InitialRequestState {
  final InitialRequest initialRequest;
  const InitialRequestCreateState(this.initialRequest);

  @override
  List<Object> get props => [initialRequest];
}

class InitialRequestUpdateState extends InitialRequestState {
  final InitialRequest initialRequest;
  const InitialRequestUpdateState(this.initialRequest);

  @override
  List<Object> get props => [initialRequest];
}

class InitialRequestDeleteState extends InitialRequestState {
  final InitialRequest initialRequest;
  const InitialRequestDeleteState(this.initialRequest);

  @override
  List<Object> get props => [initialRequest];
}

class InitialRequestListState extends InitialRequestState {
  final InitialRequest initialRequest;
  const InitialRequestListState(this.initialRequest);

  @override
  List<Object> get props => [initialRequest];
}

class InitialRequestError extends InitialRequestState {
  final String message;
  const InitialRequestError(this.message);

  @override
  List<Object> get props => [message];
}
