import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Company {
  @HiveField(0)
  int id;
  @HiveField(1)
  String cnpj;
  @HiveField(2)
  String razaoSocial;
  @HiveField(3)
  String nomeFantasia;
  @HiveField(4)
  String descricao;
  @HiveField(5)
  String srcImage;
  @HiveField(6)
  String phone;
  @HiveField(7)
  int idTypeCompany;
  @HiveField(8)
  String nameImage;

  Company(
      {this.id,
      this.cnpj,
      this.razaoSocial,
      this.nomeFantasia,
      this.descricao,
      this.srcImage,
      this.phone,
      this.idTypeCompany,
      this.nameImage});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
