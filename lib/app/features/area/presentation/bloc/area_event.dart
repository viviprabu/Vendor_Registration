part of 'area_bloc.dart';

abstract class AreaEvent extends Equatable {
  const AreaEvent();

  @override
  List<Object> get props => [];
}

class AreaInitialEvent extends AreaEvent {}

class AreasListEvent extends AreaEvent {}

class AreaCreateEvent extends AreaEvent {
  final AreaCreate areaCreate;
  const AreaCreateEvent(this.areaCreate);

  @override
  List<Object> get props => [areaCreate];
}

class AreaUpdateEvent extends AreaEvent {
  final AreaUpdate areaUpdate;
  const AreaUpdateEvent(this.areaUpdate);

  @override
  List<Object> get props => [areaUpdate];
}

class AreaDeleteEvent extends AreaEvent {
  final Area area;
  const AreaDeleteEvent(this.area);

  @override
  List<Object> get props => [area];
}

class AreaListEvent extends AreaEvent {
  final String id;
  const AreaListEvent(this.id);

  @override
  List<Object> get props => [id];
}
