part of 'governorate_bloc.dart';

abstract class GovernorateEvent extends Equatable {
  const GovernorateEvent();

  @override
  List<Object> get props => [];
}

class GovernorateInitialEvent extends GovernorateEvent {}

class GovernoratesListEvent extends GovernorateEvent {}

class GovernorateCreateEvent extends GovernorateEvent {
  final GovernorateCreate governorateCreate;
  const GovernorateCreateEvent(this.governorateCreate);

  @override
  List<Object> get props => [governorateCreate];
}

class GovernorateUpdateEvent extends GovernorateEvent {
  final GovernorateUpdate governorateUpdate;
  const GovernorateUpdateEvent(this.governorateUpdate);

  @override
  List<Object> get props => [governorateUpdate];
}

class GovernorateDeleteEvent extends GovernorateEvent {
  final Governorate governorate;
  const GovernorateDeleteEvent(this.governorate);

  @override
  List<Object> get props => [governorate];
}

class GovernorateListEvent extends GovernorateEvent {
  final String id;
  const GovernorateListEvent(this.id);

  @override
  List<Object> get props => [id];
}
