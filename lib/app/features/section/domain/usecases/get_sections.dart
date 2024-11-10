import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/domain/repositories/sections_repository.dart';

class GetSection {
  final SectionRepository repository;

  GetSection(this.repository);

  Future<Either<Failure, Section>> call(int id) async {
    return await repository.getSection(id);
  }
}
