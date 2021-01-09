import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class Token extends HiveObject{
  @HiveField(0)
  String token;

  Token(this.token);

  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
