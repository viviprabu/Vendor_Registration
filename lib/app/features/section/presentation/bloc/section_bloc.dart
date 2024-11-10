import 'package:equatable/equatable.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/domain/usecases/add_section.dart';
import 'package:finance_app/app/features/section/domain/usecases/delete_section.dart';
import 'package:finance_app/app/features/section/domain/usecases/get_section.dart';
import 'package:finance_app/app/features/section/domain/usecases/get_sections.dart';
import 'package:finance_app/app/features/section/domain/usecases/update_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'section_event.dart';
part 'section_state.dart';

class SectionBloc extends Bloc<SectionEvent, SectionState> {
  GetSection getSection;
  CreateSection createSection;
  DeleteSection deleteSection;
  GetSections getSections;
  UpdateSection updateSection;

  SectionBloc({
    required this.getSection,
    required this.createSection,
    required this.deleteSection,
    required this.getSections,
    required this.updateSection,
  }) : super(SectionInitialState()) {
    on<SectionListEvent>((event, emit) async {
      emit(SectionLoadingState());
      final failureOrSection = await getSection(event.id);
      failureOrSection.fold(
        (failure) => emit(SectionError(failure.toString())),
        (section) => emit(SectionListState(section)),
      );
    });

    on<SectionsListEvent>((event, emit) async {
      emit(SectionLoadingState());
      final failureOrSections = await getSections();
      failureOrSections.fold(
        (failure) => emit(SectionError(failure.toString())),
        (sections) => emit(SectionsListState(sections)),
      );
    });

    on<SectionCreateEvent>((event, emit) async {
      emit(SectionLoadingState());
      final failureOrSections = await createSection(event.section);
      failureOrSections.fold(
        (failure) => emit(SectionError(failure.toString())),
        (department) => emit(SectionCreateState(department)),
      );
    });

    on<SectionUpdateEvent>((event, emit) async {
      emit(SectionLoadingState());
      final failureOrSection = await updateSection(event.section);
      failureOrSection.fold(
        (failure) => emit(SectionError(failure.toString())),
        (section) => emit(SectionUpdateState(section)),
      );
    });

    on<SectionDeleteEvent>((event, emit) async {
      emit(SectionLoadingState());
      final failureOrSection = await deleteSection(event.section);
      failureOrSection.fold(
        (failure) => emit(SectionError(failure.toString())),
        (section) => emit(SectionDeleteState(section)),
      );
    });

    on<SectionInitialEvent>((event, emit) {
      emit(SectionInitialState());
    });
  }
}
