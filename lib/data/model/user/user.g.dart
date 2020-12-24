// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      cpf: fields[3] as String,
      email: fields[4] as String,
      phone: fields[7] as String,
      password: fields[5] as String,
      birthDate: fields[6] as String,
      idGender: fields[8] as int,
      idTypeUser: fields[9] as int,
      idCompany: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.cpf)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.birthDate)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.idGender)
      ..writeByte(9)
      ..write(obj.idTypeUser)
      ..writeByte(10)
      ..write(obj.idCompany);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
