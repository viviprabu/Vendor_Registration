
import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/repositories/company_type_repository.dart';



class DeleteCompanyType {
  final CompanyTypeRepository companyTypeRepository;

  DeleteCompanyType(this.companyTypeRepository);

  Future<Either<Failure, CompanyType>> call(CompanyType companyType) async {
    return await companyTypeRepository.deleteCompanyType(companyType);
  }
}
