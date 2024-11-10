part of 'section_bloc.dart';

abstract class SectionState extends Equatable {
  const SectionState();

  @override
  List<Object> get props => [];
}

class SectionInitialState extends SectionState {}

class SectionLoadingState extends SectionState {}

class SectionCreateState extends SectionState {
  final Section section;
  const SectionCreateState(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionsListState extends SectionState {
  final List<Section> sections;
  const SectionsListState(this.sections);

  @override
  List<Object> get props => [sections];
}

class SectionUpdateState extends SectionState {
  final Section section;
  const SectionUpdateState(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionDeleteState extends SectionState {
  final Section section;
  const SectionDeleteState(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionListState extends SectionState {
  final Section section;
  const SectionListState(this.section);

  @override
  List<Object> get props => [Section];
}

class SectionError extends SectionState {
  final String message;
  const SectionError(this.message);

  @override
  List<Object> get props => [message];
}
