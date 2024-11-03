part of 'sector_bloc.dart';

abstract class SectorState extends Equatable {
  const SectorState();

  @override
  List<Object> get props => [];
}

class SectorInitial extends SectorState {}

class SectorCreatedState extends SectorState {}

class SectorListedState extends SectorState {}
