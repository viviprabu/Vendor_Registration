import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_create.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_update.dart';




abstract interface class CompanyTypeRepository {
  Future<Either<Failure, CompanyType>> getCompanyType(String id);
  Future<Either<Failure, CompanyType>> updateCompanyType(CompanyTypeUpdate companyTypeUpdate);
  Future<Either<Failure, CompanyType>> deleteCompanyType(CompanyType companyType);
  Future<Either<Failure, CompanyType>> createCompanyType(CompanyTypeCreate companyTypeCreate);
  Future<Either<Failure, List<CompanyType>>> getCompanyTypes();
}
