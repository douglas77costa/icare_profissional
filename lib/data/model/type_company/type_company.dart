import 'package:json_annotation/json_annotation.dart';

part 'type_company.g.dart';

@JsonSerializable()
class TypeCompany {
  int id;
  String description;

  TypeCompany(this.id, this.description);

  factory TypeCompany.fromJson(Map<String, dynamic> json) =>
      _$TypeCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$TypeCompanyToJson(this);
}
