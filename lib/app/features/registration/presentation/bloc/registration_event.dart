part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationInitialEvent extends RegistrationEvent {}

class RegistrationsListEvent extends RegistrationEvent {}

class RegistrationCreateEvent extends RegistrationEvent {
  final Registration registration;
  const RegistrationCreateEvent(this.registration);

  @override
  List<Object> get props => [Registration];
}

class RegistrationUpdateEvent extends RegistrationEvent {
  final Registration registration;
  const RegistrationUpdateEvent(this.registration);

  @override
  List<Object> get props => [Registration];
}

class RegistrationDeleteEvent extends RegistrationEvent {
  final Registration registration;
  const RegistrationDeleteEvent(this.registration);

  @override
  List<Object> get props => [Registration];
}

class RegistrationListEvent extends RegistrationEvent {
  final int id;
  const RegistrationListEvent(this.id);

  @override
  List<Object> get props => [id];
}
