import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class User extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String cpf;
  @HiveField(4)
  String email;
  @HiveField(5)
  String password;
  @HiveField(6)
  String birthDate;
  @HiveField(7)
  String phone;
  @HiveField(8)
  int idGender;
  @HiveField(9)
  int idTypeUser;
  @HiveField(10)
  int idCompany;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.cpf,
      this.email,
      this.phone,
      this.password,
      this.birthDate,
      this.idGender,
      this.idTypeUser,
      this.idCompany});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
