import 'package:finance_app/app/features/section/data/models/sections_modal.dart';

abstract interface class SectionRemoteDataSource {
  Future<SectionModal> getSection(int id);
  Future<SectionModal> updateSection(SectionModal sectionModel);
  Future<SectionModal> deleteSection(SectionModal sectionModel);
  Future<SectionModal> createSection(SectionModal sectionModel);
  Future<List<SectionModal>> getSections();
}
