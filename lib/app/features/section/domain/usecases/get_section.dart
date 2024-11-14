import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/domain/repositories/sections_repository.dart';

class GetSections {
  final SectionRepository repository;

  GetSections(this.repository);

  Future<Either<Failure, List<Section>>> call() async {
    return await repository.getSections();
  }
}
