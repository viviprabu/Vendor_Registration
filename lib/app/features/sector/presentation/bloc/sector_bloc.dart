<<<<<<< HEAD
<<<<<<< HEAD
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
=======
import 'package:finance_app/app/features/sector/domain/usecases/create_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/delete_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/get_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/get_sectors.dart';
import 'package:finance_app/app/features/sector/domain/usecases/update_sector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
>>>>>>> f7e11a9fd8554a2341fb30a5af2927e7b75b9c06
=======
import 'package:finance_app/app/features/sector/domain/usecases/create_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/delete_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/get_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/get_sectors.dart';
import 'package:finance_app/app/features/sector/domain/usecases/update_sector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/sector/domain/entities/sector.dart';
>>>>>>> f7e11a9fd8554a2341fb30a5af2927e7b75b9c06

part 'sector_event.dart';
part 'sector_state.dart';

class SectorBloc extends Bloc<SectorEvent, SectorState> {
  GetSector getSector;
  CreateSector createSector;
  DeleteSector deleteSector;
  GetSectors getSectors;
  UpdateSector updateSector;

  SectorBloc({
    required this.getSector,
    required this.createSector,
    required this.deleteSector,
    required this.getSectors,
    required this.updateSector,
  }) : super(SectorInitialState()) {
    on<SectorListEvent>((event, emit) async {
      emit(SectorLoadingState());
      final failureOrSector = await getSector(event.id);
      failureOrSector.fold(
        (failure) => emit(SectorError(failure.toString())),
        (sector) => emit(SectorListState(sector)),
      );
    });

    on<SectorsListEvent>((event, emit) async {
      emit(SectorLoadingState());
      final failureOrSectors = await getSectors();
      failureOrSectors.fold(
        (failure) => emit(SectorError(failure.toString())),
        (sectors) => emit(SectorsListState(sectors)),
      );
    });

    on<SectorCreateEvent>((event, emit) async {
      emit(SectorLoadingState());
      final failureOrSector = await createSector(event.sector);
      failureOrSector.fold(
        (failure) => emit(SectorError(failure.toString())),
        (sector) => emit(SectorCreateState(sector)),
      );
    });

    on<SectorUpdateEvent>((event, emit) async {
      emit(SectorLoadingState());
      final failureOrSector = await updateSector(event.sector);
      failureOrSector.fold(
        (failure) => emit(SectorError(failure.toString())),
        (sector) => emit(SectorUpdateState(sector)),
      );
    });

    on<SectorDeleteEvent>((event, emit) async {
      emit(SectorLoadingState());
      final failureOrSector = await deleteSector(event.sector);
      failureOrSector.fold(
        (failure) => emit(SectorError(failure.toString())),
        (sector) => emit(SectorDeleteState(sector)),
      );
    });
  }
}
