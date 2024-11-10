part of 'section_bloc.dart';

abstract class SectionEvent extends Equatable {
  const SectionEvent();

  @override
  List<Object> get props => [];
}

class SectionInitialEvent extends SectionEvent {}

class SectionsListEvent extends SectionEvent {}

class SectionCreateEvent extends SectionEvent {
  final Section section;
  const SectionCreateEvent(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionUpdateEvent extends SectionEvent {
  final Section section;
  const SectionUpdateEvent(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionDeleteEvent extends SectionEvent {
  final Section section;
  const SectionDeleteEvent(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionListEvent extends SectionEvent {
  final int id;
  const SectionListEvent(this.id);

  @override
  List<Object> get props => [id];
}
