import 'package:json_annotation/json_annotation.dart';

part 'service_entity.g.dart';

@JsonSerializable()
class ServiceEntity {
  int id;
  int idCompany;
  String description;
  String price;
  DateTime duration;
  int idTypeLocation;
  String srcImg;

  ServiceEntity(
      {this.id,
        this.idCompany,
        this.description,
        this.price,
        this.duration,
        this.idTypeLocation,
        this.srcImg});

  factory ServiceEntity.fromJson(Map<String, dynamic> json) => _$ServiceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceEntityToJson(this);
}