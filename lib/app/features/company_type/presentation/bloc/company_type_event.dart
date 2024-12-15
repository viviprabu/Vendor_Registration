part of 'company_type_bloc.dart';

abstract class CompanyTypeEvent extends Equatable {
  const CompanyTypeEvent();

  @override
  List<Object> get props => [];
}

class CompanyTypeInitialEvent extends CompanyTypeEvent {}

class CompanyTypesListEvent extends CompanyTypeEvent {}

class CompanyTypeCreateEvent extends CompanyTypeEvent {
  final CompanyTypeCreate companyTypeCreate;
  const CompanyTypeCreateEvent(this.companyTypeCreate);

  @override
  List<Object> get props => [companyTypeCreate];
}

class CompanyTypeUpdateEvent extends CompanyTypeEvent {
  final CompanyTypeUpdate companyTypeUpdate;
  const CompanyTypeUpdateEvent(this.companyTypeUpdate);

  @override
  List<Object> get props => [companyTypeUpdate];
}

class CompanyTypeDeleteEvent extends CompanyTypeEvent {
  final CompanyType companyType;
  const CompanyTypeDeleteEvent(this.companyType);

  @override
  List<Object> get props => [companyType];
}

class CompanyTypeListEvent extends CompanyTypeEvent {
  final String id;
  const CompanyTypeListEvent(this.id);

  @override
  List<Object> get props => [id];
}
