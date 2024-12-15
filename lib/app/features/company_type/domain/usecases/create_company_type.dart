import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_create.dart';
import 'package:vendor_registration/app/features/company_type/domain/repositories/company_type_repository.dart';



class CreateCompanyType {
  final CompanyTypeRepository companyTypeRepository;

  CreateCompanyType(this.companyTypeRepository);

  Future<Either<Failure, CompanyType>> call(CompanyTypeCreate companyTypeCreate) async {
    return await companyTypeRepository.createCompanyType(companyTypeCreate);
  }
}
