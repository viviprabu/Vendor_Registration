import 'package:equatable/equatable.dart';

class AppSettingSysFunction extends Equatable {
  final int? id;
  final String? name;
  final String? description;

  const AppSettingSysFunction({this.id, this.name, this.description});

  @override
  List<Object?> get props => [id, name, description];
}
