part of 'company_type_bloc.dart';

abstract class CompanyTypeState extends Equatable {
  const CompanyTypeState();

  @override
  List<Object> get props => [];
}

class CompanyTypeInitial extends CompanyTypeState {}

class CompanyTypeLoading extends CompanyTypeState {}

class CompanyTypesListState extends CompanyTypeState {
  final List<CompanyType> companyTypes;
  const CompanyTypesListState(this.companyTypes);

  @override
  List<Object> get props => [companyTypes];
}

class CompanyTypeCreateState extends CompanyTypeState {
  final CompanyType companyType;
  const CompanyTypeCreateState(this.companyType);

  @override
  List<Object> get props => [CompanyType];
}

class CompanyTypeUpdateState extends CompanyTypeState {
  final CompanyType companyType;
  const CompanyTypeUpdateState(this.companyType);

  @override
  List<Object> get props => [CompanyType];
}

class CompanyTypeDeleteState extends CompanyTypeState {
  final CompanyType companyType;
  const CompanyTypeDeleteState(this.companyType);

  @override
  List<Object> get props => [CompanyType];
}

class CompanyTypeListState extends CompanyTypeState {
  final CompanyType companyType;
  const CompanyTypeListState(this.companyType);

  @override
  List<Object> get props => [CompanyType];
}

class CompanyTypeError extends CompanyTypeState {
  final String message;
  const CompanyTypeError(this.message);

  @override
  List<Object> get props => [message];
}
