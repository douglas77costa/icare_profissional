// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    cpf: json['cpf'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    password: json['password'] as String,
    birthDate: json['birthDate'] as String,
    idGender: json['idGender'] as int,
    idTypeUser: json['idTypeUser'] as int,
    idCompany: json['idCompany'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'cpf': instance.cpf,
      'email': instance.email,
      'password': instance.password,
      'birthDate': instance.birthDate,
      'phone': instance.phone,
      'idGender': instance.idGender,
      'idTypeUser': instance.idTypeUser,
      'idCompany': instance.idCompany,
    };
