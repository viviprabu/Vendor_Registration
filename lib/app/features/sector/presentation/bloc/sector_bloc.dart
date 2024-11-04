import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sector_event.dart';
part 'sector_state.dart';

class SectorBloc extends Bloc<SectorEvent, SectorState> {
  SectorBloc() : super(SectorInitial()) {
    on<SectorEvent>((event, emit) {});
  }
}
