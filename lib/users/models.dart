import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class User{
  String uid;
  String name;
  int lumeeiCoins;

  User(
      {this. uid = "", this.name = '', this.lumeeiCoins = 0});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}