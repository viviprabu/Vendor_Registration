import 'package:dartz/dartz.dart';
import 'package:vendor_registration/app/core/errors/server_failure.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/repositories/company_type_repository.dart';


class GetCompanyTypes {
  final CompanyTypeRepository repository;

  GetCompanyTypes(this.repository);

  Future<Either<Failure, List<CompanyType>>> call() async {
    return await repository.getCompanyTypes();
  }
}
