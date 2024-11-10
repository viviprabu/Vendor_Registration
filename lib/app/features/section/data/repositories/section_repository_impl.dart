import 'package:dartz/dartz.dart';
import 'package:finance_app/app/core/errors/server_failure.dart';
import 'package:finance_app/app/features/section/data/datasources/section_remote_data_source.dart';
import 'package:finance_app/app/features/section/data/models/sections_modal.dart';
import 'package:finance_app/app/features/section/domain/entities/sections.dart';
import 'package:finance_app/app/features/section/domain/repositories/sections_repository.dart';

class SectionRepositoryImpl implements SectionRepository {
  final SectionRemoteDataSource sectionRemoteDataSource;
  SectionRepositoryImpl({required this.sectionRemoteDataSource});

  @override
  Future<Either<Failure, Section>> getSection(int id) async {
    try {
      final SectionModal sector = await sectionRemoteDataSource.getSection(id);
      return Right(sector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Section>>> getSections() async {
    try {
      final List<SectionModal> section =
          await sectionRemoteDataSource.getSections();
      final List<Section> deptList =
          section.map((dept) => dept.toEntity()).toList();
      return Right(deptList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Section>> updateSection(Section section) async {
    try {
      final SectionModal updatedSection =
          await sectionRemoteDataSource.updateSection(section as SectionModal);
      return Right(updatedSection.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Section>> deleteSection(Section section) async {
    try {
      final SectionModal deletedSector =
          await sectionRemoteDataSource.deleteSection(section as SectionModal);
      return Right(deletedSector.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Section>> createSection(Section section) async {
    try {
      final SectionModal sectionModal = SectionModal.fromEntity(section);
      final SectionModal createdSection =
          await sectionRemoteDataSource.createSection(sectionModal);
      return Right(createdSection.toEntity());
    } catch (e) {
      final ServerFailure serverFailure = ServerFailure(e.toString());
      return Left(serverFailure);
    }
  }
}
