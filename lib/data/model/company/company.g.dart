// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as int,
    cnpj: json['cnpj'] as String,
    razaoSocial: json['razaoSocial'] as String,
    nomeFantasia: json['nomeFantasia'] as String,
    descricao: json['descricao'] as String,
    srcImage: json['srcImage'] as String,
    phone: json['phone'] as String,
    idTypeCompany: json['idTypeCompany'] as int,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'cnpj': instance.cnpj,
      'razaoSocial': instance.razaoSocial,
      'nomeFantasia': instance.nomeFantasia,
      'descricao': instance.descricao,
      'srcImage': instance.srcImage,
      'phone': instance.phone,
      'idTypeCompany': instance.idTypeCompany,
    };
