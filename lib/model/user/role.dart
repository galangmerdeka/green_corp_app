import 'package:json_annotation/json_annotation.dart';
part 'role.g.dart';

@JsonSerializable()
class Role {
  String? slug;

  Role({this.slug});

  // Role.fromJson(Map<String, dynamic> json) {
  //   slug = json["slug"];
  // }
  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
