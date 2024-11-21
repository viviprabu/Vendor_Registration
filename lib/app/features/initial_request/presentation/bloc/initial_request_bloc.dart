import 'package:finance_app/app/features/initial_request/domain/usecases/create_initial_request.dart';
import 'package:finance_app/app/features/initial_request/domain/usecases/delete_initial_request.dart';
import 'package:finance_app/app/features/initial_request/domain/usecases/get_initial_request.dart';
import 'package:finance_app/app/features/initial_request/domain/usecases/get_initial_requests.dart';
import 'package:finance_app/app/features/initial_request/domain/usecases/update_initial_request.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_event.dart';
import 'package:finance_app/app/features/initial_request/presentation/bloc/initial_request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialRequestBloc
    extends Bloc<InitialRequestEvent, InitialRequestState> {
  GetInitialRequest getInitialRequest;
  GetInitialRequests getInitialRequests;
  CreateInitialRequest createInitialRequest;
  UpdateInitialRequest updateInitialRequest;
  DeleteInitialRequest deleteInitialRequest;

  InitialRequestBloc({
    required this.getInitialRequest,
    required this.getInitialRequests,
    required this.createInitialRequest,
    required this.updateInitialRequest,
    required this.deleteInitialRequest,
  }) : super(InitialRequestInitial()) {
    on<InitialRequestListEvent>((event, emit) async {
      emit(InitialRequestLoadingState());
      final failureOrInitialRequest = await getInitialRequest(event.id);
      failureOrInitialRequest.fold(
        (failure) => emit(InitialRequestError(failure.toString())),
        (initialRequest) => emit(InitialRequestListState(initialRequest)),
      );
    });

    on<InitialRequestsListEvent>((event, emit) async {
      emit(InitialRequestLoadingState());
      final failureOrInitialRequests = await getInitialRequests();
      failureOrInitialRequests.fold(
        (failure) => emit(InitialRequestError(failure.toString())),
        (initialRequests) => emit(InitialRequestsListState(initialRequests)),
      );
    });

    on<InitialRequestCreateEvent>((event, emit) async {
      emit(InitialRequestLoadingState());
      final failureOrInitialRequest =
          await createInitialRequest(event.initialRequestCreate);
      failureOrInitialRequest.fold(
        (failure) => emit(InitialRequestError(failure.toString())),
        (initialRequest) => emit(InitialRequestCreateState(initialRequest)),
      );
    });

    on<InitialRequestUpdateEvent>((event, emit) async {
      emit(InitialRequestLoadingState());
      final failureOrInitialRequest =
          await updateInitialRequest(event.initialRequestUpdate);
      failureOrInitialRequest.fold(
        (failure) => emit(InitialRequestError(failure.toString())),
        (initialRequest) => emit(InitialRequestUpdateState(initialRequest)),
      );
    });

    on<InitialRequestDeleteEvent>((event, emit) async {
      emit(InitialRequestLoadingState());
      final failureOrInitialRequest =
          await deleteInitialRequest(event.initialRequest);
      failureOrInitialRequest.fold(
        (failure) => emit(InitialRequestError(failure.toString())),
        (initialRequest) => emit(InitialRequestDeleteState(initialRequest)),
      );
    });

    on<InitialRequestInitialEvent>((event, emit) {
      emit(InitialRequestInitial());
    });
  }
}
