
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_create.dart';
import 'package:vendor_registration/app/features/company_type/domain/entities/company_type_update.dart';
import 'package:vendor_registration/app/features/company_type/domain/usecases/create_company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/usecases/delete_company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/usecases/get_company_type.dart';
import 'package:vendor_registration/app/features/company_type/domain/usecases/get_company_types.dart';
import 'package:vendor_registration/app/features/company_type/domain/usecases/update_company_type.dart';



part 'company_type_event.dart';
part 'company_type_state.dart';

class CompanyTypeBloc extends Bloc<CompanyTypeEvent, CompanyTypeState> {
  GetCompanyType getCompanyType;
  GetCompanyTypes getCompanyTypes;
  CreateCompanyType createCompanyType;
  UpdateCompanyType updateCompanyType;
  DeleteCompanyType deleteCompanyType;

  CompanyTypeBloc({
    required this.getCompanyType,
    required this.getCompanyTypes,
    required this.createCompanyType,
    required this.updateCompanyType,
    required this.deleteCompanyType,
  }) : super(CompanyTypeInitial()) {
    on<CompanyTypeListEvent>((event, emit) async {
      emit(CompanyTypeLoading());
      final failureOrCompanyType = await getCompanyType(event.id);
      failureOrCompanyType.fold(
        (failure) => emit(CompanyTypeError(failure.toString())),
        (companyType) => emit(CompanyTypeListState(companyType)),
      );
    });

    on<CompanyTypesListEvent>((event, emit) async {
      emit(CompanyTypeLoading());
      final failureOrCompanyTypes = await getCompanyTypes();
      failureOrCompanyTypes.fold(
        (failure) => emit(CompanyTypeError(failure.toString())),
        (companyTypes) => emit(CompanyTypesListState(companyTypes)),
      );
    });

    on<CompanyTypeCreateEvent>((event, emit) async {
      emit(CompanyTypeLoading());
      final failureOrCompanyType = await createCompanyType(event.companyTypeCreate);
      failureOrCompanyType.fold(
        (failure) => emit(CompanyTypeError(failure.toString())),
        (companyType) => emit(CompanyTypeCreateState(companyType)),
      );
    });

    on<CompanyTypeUpdateEvent>((event, emit) async {
      emit(CompanyTypeLoading());
      final failureOrCompanyType = await updateCompanyType(event.companyTypeUpdate);
      failureOrCompanyType.fold(
        (failure) => emit(CompanyTypeError(failure.toString())),
        (companyType) => emit(CompanyTypeUpdateState(companyType)),
      );
    });

    on<CompanyTypeDeleteEvent>((event, emit) async {
      emit(CompanyTypeLoading());
      final failureOrCompanyType = await deleteCompanyType(event.companyType);
      failureOrCompanyType.fold(
        (failure) => emit(CompanyTypeError(failure.toString())),
        (companyType) => emit(CompanyTypeDeleteState(companyType)),
      );
    });

    on<CompanyTypeInitialEvent>((event, emit) {
      emit(CompanyTypeInitial());
    });
  }
}
