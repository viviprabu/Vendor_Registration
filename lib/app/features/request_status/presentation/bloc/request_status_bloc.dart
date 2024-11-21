import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_status_event.dart';
part 'request_status_state.dart';

class RequestStatusBloc extends Bloc<RequestStatusEvent, RequestStatusState> {
  RequestStatusBloc() : super(RequestStatusInitial()) {
    on<RequestStatusEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
