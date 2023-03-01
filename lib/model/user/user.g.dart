// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      type_user: json['type_user'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      token: json['token'] as String?,
      token_exp: json['token_exp'] == null
          ? null
          : DateTime.parse(json['token_exp'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'type_user': instance.type_user,
      'role': instance.role,
      'token': instance.token,
      'token_exp': instance.token_exp?.toIso8601String(),
    };
