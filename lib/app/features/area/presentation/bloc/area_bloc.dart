
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/Area/domain/usecases/create_Area.dart';
import 'package:vendor_registration/app/features/Area/domain/usecases/delete_Area.dart';
import 'package:vendor_registration/app/features/Area/domain/usecases/get_Area.dart';
import 'package:vendor_registration/app/features/Area/domain/usecases/get_Areas.dart';
import 'package:vendor_registration/app/features/Area/domain/usecases/update_Area.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_create.dart';
import 'package:vendor_registration/app/features/area/domain/entities/area_update.dart';


part 'area_event.dart';
part 'area_state.dart';

class AreaBloc extends Bloc<AreaEvent, AreaState> {
  GetArea getArea;
  GetAreas getAreas;
  CreateArea createArea;
  UpdateArea updateArea;
  DeleteArea deleteArea;

  AreaBloc({
    required this.getArea,
    required this.getAreas,
    required this.createArea,
    required this.updateArea,
    required this.deleteArea,
  }) : super(AreaInitial()) {
    on<AreaListEvent>((event, emit) async {
      emit(AreaLoading());
      final failureOrArea = await getArea(event.id);
      failureOrArea.fold(
        (failure) => emit(AreaError(failure.toString())),
        (area) => emit(AreaListState(area)),
      );
    });

    on<AreasListEvent>((event, emit) async {
      emit(AreaLoading());
      final failureOrAreas = await getAreas();
      failureOrAreas.fold(
        (failure) => emit(AreaError(failure.toString())),
        (areas) => emit(AreasListState(areas)),
      );
    });

    on<AreaCreateEvent>((event, emit) async {
      emit(AreaLoading());
      final failureOrArea = await createArea(event.areaCreate);
      failureOrArea.fold(
        (failure) => emit(AreaError(failure.toString())),
        (area) => emit(AreaCreateState(area)),
      );
    });

    on<AreaUpdateEvent>((event, emit) async {
      emit(AreaLoading());
      final failureOrArea = await updateArea(event.areaUpdate);
      failureOrArea.fold(
        (failure) => emit(AreaError(failure.toString())),
        (area) => emit(AreaUpdateState(area)),
      );
    });

    on<AreaDeleteEvent>((event, emit) async {
      emit(AreaLoading());
      final failureOrArea = await deleteArea(event.area);
      failureOrArea.fold(
        (failure) => emit(AreaError(failure.toString())),
        (area) => emit(AreaDeleteState(area)),
      );
    });

    on<AreaInitialEvent>((event, emit) {
      emit(AreaInitial());
    });
  }
}
