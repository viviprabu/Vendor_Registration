part of 'governorate_bloc.dart';

abstract class GovernorateState extends Equatable {
  const GovernorateState();

  @override
  List<Object> get props => [];
}

class GovernorateInitial extends GovernorateState {}

class GovernorateLoading extends GovernorateState {}

class GovernoratesListState extends GovernorateState {
  final List<Governorate> governorates;
  const GovernoratesListState(this.governorates);

  @override
  List<Object> get props => [governorates];
}

class GovernorateCreateState extends GovernorateState {
  final Governorate governorate;
  const GovernorateCreateState(this.governorate);

  @override
  List<Object> get props => [governorate];
}

class GovernorateUpdateState extends GovernorateState {
  final Governorate governorate;
  const GovernorateUpdateState(this.governorate);

  @override
  List<Object> get props => [governorate];
}

class GovernorateDeleteState extends GovernorateState {
  final Governorate governorate;
  const GovernorateDeleteState(this.governorate);

  @override
  List<Object> get props => [governorate];
}

class GovernorateListState extends GovernorateState {
  final Governorate governorate;
  const GovernorateListState(this.governorate);

  @override
  List<Object> get props => [governorate];
}

class GovernorateError extends GovernorateState {
  final String message;
  const GovernorateError(this.message);

  @override
  List<Object> get props => [message];
}
