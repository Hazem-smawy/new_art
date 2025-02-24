// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String,
      password: json['password'] as String? ?? '',
      mobile: json['mobile'] as String,
      username: json['username'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      firstName: json['first_name'] as String,
      imageURL: json['imageURL'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'mobile': instance.mobile,
      'username': instance.username,
      'last_name': instance.lastName,
      'imageURL': instance.imageURL,
      'first_name': instance.firstName,
    };
