// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 1;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      id: fields[0] as int,
      cnpj: fields[1] as String,
      razaoSocial: fields[2] as String,
      nomeFantasia: fields[3] as String,
      descricao: fields[4] as String,
      srcImage: fields[5] as String,
      phone: fields[6] as String,
      idTypeCompany: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.cnpj)
      ..writeByte(2)
      ..write(obj.razaoSocial)
      ..writeByte(3)
      ..write(obj.nomeFantasia)
      ..writeByte(4)
      ..write(obj.descricao)
      ..writeByte(5)
      ..write(obj.srcImage)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.idTypeCompany);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
