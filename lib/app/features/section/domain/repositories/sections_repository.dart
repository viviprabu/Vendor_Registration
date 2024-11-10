import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';

abstract interface class SectionRepository {
  Future<Either<Failure, Section>> getSection(int id);
  Future<Either<Failure, Section>> updateSection(Section section);
  Future<Either<Failure, Section>> deleteSection(Section section);
  Future<Either<Failure, Section>> createSection(Section section);
  Future<Either<Failure, List<Section>>> getSections();
}
