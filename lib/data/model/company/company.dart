import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  int id;
  String cnpj;
  String razaoSocial;
  String nomeFantasia;
  String descricao;
  String srcImage;
  String phone;
  int idTypeCompany;

  Company(
      {this.id,
      this.cnpj,
      this.razaoSocial,
      this.nomeFantasia,
      this.descricao,
      this.srcImage,
      this.phone,
      this.idTypeCompany});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
