import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/domain/repositories/sections_repository.dart';

class CreateSection {
  final SectionRepository sectionRepository;

  CreateSection(this.sectionRepository);

  Future<Either<Failure, Section>> call(Section section) async {
    return await sectionRepository.createSection(section);
  }
}
