import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/registration/domain/entities/registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/add_registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/delete_registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/get_registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/get_registrations.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/update_registration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  GetRegistration getRegistration;
  CreateRegistration createRegistration;
  DeleteRegistration deleteRegistration;
  GetRegistrations getRegistrations;
  UpdateRegistration updateRegistration;

  RegistrationBloc({
    required this.getRegistration,
    required this.createRegistration,
    required this.deleteRegistration,
    required this.getRegistrations,
    required this.updateRegistration,
  }) : super(RegistrationInitialState()) {
    on<RegistrationListEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      final failureOrSector = await getRegistration(event.id);
      failureOrSector.fold(
        (failure) => emit(RegistrationError(failure.toString())),
        (registration) => emit(RegistrationListState(registration)),
      );
    });

    on<RegistrationsListEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      final failureOrRegistrations = await getRegistrations();
      failureOrRegistrations.fold(
        (failure) => emit(RegistrationError(failure.toString())),
        (registrations) => emit(RegistrationsListState(registrations)),
      );
    });

    on<RegistrationCreateEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      final failureOrRegistrations =
          await createRegistration(event.registration);
      failureOrRegistrations.fold(
        (failure) => emit(RegistrationError(failure.toString())),
        (registration) => emit(RegistrationCreateState(registration)),
      );
    });

    on<RegistrationUpdateEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      final failureOrRegistration =
          await updateRegistration(event.registration);
      failureOrRegistration.fold(
        (failure) => emit(RegistrationError(failure.toString())),
        (registration) => emit(RegistrationUpdateState(registration)),
      );
    });

    on<RegistrationDeleteEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      final failureOrRegistration =
          await deleteRegistration(event.registration);
      failureOrRegistration.fold(
        (failure) => emit(RegistrationError(failure.toString())),
        (registration) => emit(RegistrationDeleteState(registration)),
      );
    });

    on<RegistrationInitialEvent>((event, emit) {
      emit(RegistrationInitialState());
    });
  }
}
