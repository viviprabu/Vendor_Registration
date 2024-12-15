import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/repositories/company_type_repository.dart';


class GetCompanyType {
  final CompanyTypeRepository repository;

  GetCompanyType(this.repository);

  Future<Either<Failure, CompanyType>> call(String id) async {
    return await repository.getCompanyType(id);
  }
}
