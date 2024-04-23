// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => ProfileUser(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$ProfileUserToJson(ProfileUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
