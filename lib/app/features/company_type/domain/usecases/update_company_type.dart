import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_update.dart';
import 'package:vendor_registration/app/features/company_type/domain/repositories/company_type_repository.dart';



class UpdateCompanyType {
  final CompanyTypeRepository companyTypeRepository;

  UpdateCompanyType(this.companyTypeRepository);

  Future<Either<Failure, CompanyType>> call(CompanyTypeUpdate companyTypeUpdate) async {
    return await companyTypeRepository.updateCompanyType(companyTypeUpdate);
  }
}