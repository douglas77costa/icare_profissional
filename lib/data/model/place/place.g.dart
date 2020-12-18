// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    id: json['id'] as int,
    idCompany: json['idCompany'] as int,
    city: json['city'] as String,
    state: json['state'] as String,
    zipCode: json['zipCode'] as String,
    street: json['street'] as String,
    number: json['number'] as String,
    complement: json['complement'] as String,
    neighbourhood: json['neighbourhood'] as String,
  );
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'idCompany': instance.idCompany,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'street': instance.street,
      'number': instance.number,
      'complement': instance.complement,
      'neighbourhood': instance.neighbourhood,
    };
