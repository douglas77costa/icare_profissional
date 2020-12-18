
import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  int id;
  int idCompany;
  String city;
  String state;
  String zipCode;
  String street;
  String number;
  String complement;
  String neighbourhood;

  Place(
      {this.id,
      this.idCompany,
      this.city,
      this.state,
      this.zipCode,
      this.street,
      this.number,
      this.complement,
      this.neighbourhood});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
