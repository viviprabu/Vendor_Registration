import 'package:vendor_registration/app/features/user_role/domain/entities/system_function.dart';

class SystemFunctionModel extends SystemFunction {
  const SystemFunctionModel({
    required super.id,
    required super.name,
    super.description,
  });

  factory SystemFunctionModel.fromJson(Map<String, dynamic> json) {
    return SystemFunctionModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };

  factory SystemFunctionModel.fromEntity(SystemFunction systemFunction) {
    return SystemFunctionModel(
      id: systemFunction.id,
      name: systemFunction.name,
      description: systemFunction.description,
    );
  }

  SystemFunction toEntity() {
    return SystemFunction(
      id: id,
      name: name,
      description: description,
    );
  }
}
