part of 'sector_bloc.dart';

abstract class SectorState extends Equatable {
  const SectorState();

  @override
  List<Object> get props => [];
}

class SectorInitialState extends SectorState {}

class SectorLoadingState extends SectorState {}

class SectorCreateState extends SectorState {
  final Sector sector;
  const SectorCreateState(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorsListState extends SectorState {
  final List<Sector> sectors;
  const SectorsListState(this.sectors);

  @override
  List<Object> get props => [sectors];
}

class SectorUpdateState extends SectorState {
  final Sector sector;
  const SectorUpdateState(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorDeleteState extends SectorState {
  final Sector sector;
  const SectorDeleteState(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorListState extends SectorState {
  final Sector sector;
  const SectorListState(this.sector);

  @override
  List<Object> get props => [sector];
}

class SectorError extends SectorState {
  final String message;
  const SectorError(this.message);

  @override
  List<Object> get props => [message];
}
