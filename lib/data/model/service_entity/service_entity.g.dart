// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceEntity _$ServiceEntityFromJson(Map<String, dynamic> json) {
  return ServiceEntity(
    id: json['id'] as int,
    idCompany: json['idCompany'] as int,
    description: json['description'] as String,
    price: json['price'] as String,
    duration: json['duration'] == null
        ? null
        : DateTime.parse(json['duration'] as String),
    idTypeLocation: json['idTypeLocation'] as int,
    srcImg: json['srcImg'] as String,
  );
}

Map<String, dynamic> _$ServiceEntityToJson(ServiceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCompany': instance.idCompany,
      'description': instance.description,
      'price': instance.price,
      'duration': instance.duration?.toIso8601String(),
      'idTypeLocation': instance.idTypeLocation,
      'srcImg': instance.srcImg,
    };
