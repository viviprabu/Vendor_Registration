import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/data/datasources/company_type_remote_data_source.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_create_model.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_model.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_update_model.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_create.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_update.dart';
import 'package:vendor_registration/app/features/company_type/domain/repositories/company_type_repository.dart';



class CompanyTypeRepositoryImpl implements CompanyTypeRepository {
  final CompanyTypeRemoteDataSource companyTypeRemoteDataSource;
  CompanyTypeRepositoryImpl({required this.companyTypeRemoteDataSource});

  @override
  Future<Either<Failure, CompanyType>> createCompanyType(CompanyTypeCreate companyTypeCreate) async {
    try {
      final CompanyTypeCreateModel companyTypeCreateModel =
          CompanyTypeCreateModel.fromEntity(companyTypeCreate);
      final CompanyTypeModel createdCompanyType =
          await companyTypeRemoteDataSource.createCompanyType(companyTypeCreateModel);
      //print(createdCompanyType);
      return Right(createdCompanyType.toEntity());
    } catch (e) {
      //print(e);
      final ServerFailure serverFailure = ServerFailure(e.toString());

      return Left(serverFailure);
    }
  }

  @override
  Future<Either<Failure, CompanyType>> deleteCompanyType(CompanyType companyType) async {
    try {
      final CompanyTypeModel deletedCompanyType =
          await companyTypeRemoteDataSource.deleteCompanyType(companyType as CompanyTypeModel);
      return Right(deletedCompanyType.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyType>> getCompanyType(String id) async {
    try {
      final CompanyTypeModel companyType = await companyTypeRemoteDataSource.getCompanyType(id);
      return Right(companyType.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CompanyType>>> getCompanyTypes() async {
    try {
      final List<CompanyTypeModel> companyTypes = await companyTypeRemoteDataSource.getCompanyTypes();
      final List<CompanyType> companyTypesList =
          companyTypes.map((companyType) => companyType.toEntity()).toList();
      return Right(companyTypesList);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CompanyType>> updateCompanyType(CompanyTypeUpdate companyTypeUpdate) async {
    try {
      /* final CompanyTypeModel updatedCompanyType =
          await CompanyTypeRemoteDataSource.updateCompanyType(CompanyType as CompanyTypeModel);
      return Right(updatedCompanyType.toEntity()); */

      final CompanyTypeUpdateModel companyTypeUpdateModel =
          CompanyTypeUpdateModel.fromEntity(companyTypeUpdate);
      final CompanyTypeModel updatedCompanyType =
          await companyTypeRemoteDataSource.updateCompanyType(companyTypeUpdateModel);
      return Right(updatedCompanyType.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
