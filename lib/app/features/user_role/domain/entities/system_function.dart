import 'package:equatable/equatable.dart';

class SystemFunction extends Equatable {
  final int id;
  final String name;
  final String? description;
  const SystemFunction({
    required this.id,
    required this.name,
    this.description = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, description];
}
