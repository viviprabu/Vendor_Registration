part of 'area_bloc.dart';

abstract class AreaState extends Equatable {
  const AreaState();

  @override
  List<Object> get props => [];
}

class AreaInitial extends AreaState {}

class AreaLoading extends AreaState {}

class AreasListState extends AreaState {
  final List<Area> areas;
  const AreasListState(this.areas);

  @override
  List<Object> get props => [areas];
}

class AreaCreateState extends AreaState {
  final Area area;
  const AreaCreateState(this.area);

  @override
  List<Object> get props => [area];
}

class AreaUpdateState extends AreaState {
  final Area area;
  const AreaUpdateState(this.area);

  @override
  List<Object> get props => [Area];
}

class AreaDeleteState extends AreaState {
  final Area area;
  const AreaDeleteState(this.area);

  @override
  List<Object> get props => [area];
}

class AreaListState extends AreaState {
  final Area area;
  const AreaListState(this.area);

  @override
  List<Object> get props => [area];
}

class AreaError extends AreaState {
  final String message;
  const AreaError(this.message);

  @override
  List<Object> get props => [message];
}
