part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationCreateState extends RegistrationState {
  final Registration registration;
  const RegistrationCreateState(this.registration);

  @override
  List<Object> get props => [Registration];
}

class RegistrationsListState extends RegistrationState {
  final List<Registration> registrations;
  const RegistrationsListState(this.registrations);

  @override
  List<Object> get props => [registrations];
}

class RegistrationUpdateState extends RegistrationState {
  final Registration registration;
  const RegistrationUpdateState(this.registration);

  @override
  List<Object> get props => [registration];
}

class RegistrationDeleteState extends RegistrationState {
  final Registration registration;
  const RegistrationDeleteState(this.registration);

  @override
  List<Object> get props => [Registration];
}

class RegistrationListState extends RegistrationState {
  final Registration registration;
  const RegistrationListState(this.registration);

  @override
  List<Object> get props => [Registration];
}

class RegistrationError extends RegistrationState {
  final String message;
  const RegistrationError(this.message);

  @override
  List<Object> get props => [message];
}
