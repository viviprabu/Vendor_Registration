part of 'sector_bloc.dart';

abstract class SectorEvent extends Equatable {
  const SectorEvent();

  @override
  List<Object> get props => [];
}

class SectorInitialEvent extends SectorEvent {}

class SectorsListEvent extends SectorEvent {}

class SectorCreateEvent extends SectorEvent {
  final Sector sector;
  const SectorCreateEvent(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorUpdateEvent extends SectorEvent {
  final Sector sector;
  const SectorUpdateEvent(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorDeleteEvent extends SectorEvent {
  final Sector sector;
  const SectorDeleteEvent(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorListEvent extends SectorEvent {
  final int id;
  const SectorListEvent(this.id);

  @override
  List<Object> get props => [id];
}
