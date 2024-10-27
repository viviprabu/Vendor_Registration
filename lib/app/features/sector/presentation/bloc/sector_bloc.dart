import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sector_event.dart';
part 'sector_state.dart';

class SectorBloc extends Bloc<SectorEvent, SectorState> {
  SectorBloc() : super(SectorInitial()) {
    on<SectorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
