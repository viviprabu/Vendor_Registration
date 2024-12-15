
import 'package:vendor_registration/app/features/company_type/data/models/company_type_create_model.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_model.dart';
import 'package:vendor_registration/app/features/company_type/data/models/company_type_update_model.dart';

abstract interface class CompanyTypeRemoteDataSource {
  Future<CompanyTypeModel> getCompanyType(String id);
  Future<CompanyTypeModel> updateCompanyType(CompanyTypeUpdateModel companyTypeUpdateModel);
  Future<CompanyTypeModel> deleteCompanyType(CompanyTypeModel companyTypeModel);
  Future<CompanyTypeModel> createCompanyType(CompanyTypeCreateModel companyTypeCreateModel);
  Future<List<CompanyTypeModel>> getCompanyTypes();
}
