import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String firstName;
  String lastName;
  String cpf;
  String email;
  String password;
  String birthDate;
  String phone;
  int idGender;
  int idTypeUser;
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
