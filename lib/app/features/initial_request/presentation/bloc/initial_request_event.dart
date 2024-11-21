import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_create.dart';
import 'package:finance_app/app/features/initial_request/domain/entities/initial_Request_update.dart';

abstract class InitialRequestEvent extends Equatable {
  const InitialRequestEvent();

  @override
  List<Object> get props => [];
}

class InitialRequestInitialEvent extends InitialRequestEvent {}

class InitialRequestsListEvent extends InitialRequestEvent {}

class InitialRequestCreateEvent extends InitialRequestEvent {
  final InitialRequestCreate initialRequestCreate;
  const InitialRequestCreateEvent(this.initialRequestCreate);

  @override
  List<Object> get props => [initialRequestCreate];
}

class InitialRequestUpdateEvent extends InitialRequestEvent {
  final InitialRequestUpdate initialRequestUpdate;
  const InitialRequestUpdateEvent(this.initialRequestUpdate);

  @override
  List<Object> get props => [initialRequestUpdate];
}

class InitialRequestDeleteEvent extends InitialRequestEvent {
  final InitialRequest initialRequest;
  const InitialRequestDeleteEvent(this.initialRequest);

  @override
  List<Object> get props => [initialRequest];
}

class InitialRequestListEvent extends InitialRequestEvent {
  final String id;
  const InitialRequestListEvent(this.id);

  @override
  List<Object> get props => [id];
}
