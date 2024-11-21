part of 'request_status_bloc.dart';

abstract class RequestStatusState extends Equatable {
  const RequestStatusState();  

  @override
  List<Object> get props => [];
}
class RequestStatusInitial extends RequestStatusState {}
