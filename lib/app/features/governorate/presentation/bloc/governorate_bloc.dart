
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_create.dart';
import 'package:vendor_registration/app/features/governorate/domain/entities/governorate_update.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/create_governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/delete_governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/get_governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/get_governorates.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/update_governorate.dart';


part 'governorate_event.dart';
part 'governorate_state.dart';

class GovernorateBloc extends Bloc<GovernorateEvent, GovernorateState> {
  GetGovernorate getGovernorate;
  GetGovernorates getGovernorates;
  CreateGovernorate createGovernorate;
  UpdateGovernorate updateGovernorate;
  DeleteGovernorate deleteGovernorate;

  GovernorateBloc({
    required this.getGovernorate,
    required this.getGovernorates,
    required this.createGovernorate,
    required this.updateGovernorate,
    required this.deleteGovernorate,
  }) : super(GovernorateInitial()) {
    on<GovernorateListEvent>((event, emit) async {
      emit(GovernorateLoading());
      final failureOrGovernorate = await getGovernorate(event.id);
      failureOrGovernorate.fold(
        (failure) => emit(GovernorateError(failure.toString())),
        (governorate) => emit(GovernorateListState(governorate)),
      );
    });

    on<GovernoratesListEvent>((event, emit) async {
      emit(GovernorateLoading());
      final failureOrGovernorates = await getGovernorates();
      failureOrGovernorates.fold(
        (failure) => emit(GovernorateError(failure.toString())),
        (governorates) => emit(GovernoratesListState(governorates)),
      );
    });

    on<GovernorateCreateEvent>((event, emit) async {
      emit(GovernorateLoading());
      final failureOrGovernorate = await createGovernorate(event.governorateCreate);
      failureOrGovernorate.fold(
        (failure) => emit(GovernorateError(failure.toString())),
        (governorate) => emit(GovernorateCreateState(governorate)),
      );
    });

    on<GovernorateUpdateEvent>((event, emit) async {
      emit(GovernorateLoading());
      final failureOrGovernorate = await updateGovernorate(event.governorateUpdate);
      failureOrGovernorate.fold(
        (failure) => emit(GovernorateError(failure.toString())),
        (governorate) => emit(GovernorateUpdateState(governorate)),
      );
    });

    on<GovernorateDeleteEvent>((event, emit) async {
      emit(GovernorateLoading());
      final failureOrGovernorate = await deleteGovernorate(event.governorate);
      failureOrGovernorate.fold(
        (failure) => emit(GovernorateError(failure.toString())),
        (governorate) => emit(GovernorateDeleteState(governorate)),
      );
    });

    on<GovernorateInitialEvent>((event, emit) {
      emit(GovernorateInitial());
    });
  }
}
