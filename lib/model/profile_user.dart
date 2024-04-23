import 'package:json_annotation/json_annotation.dart';

part 'profile_user.g.dart';

@JsonSerializable()
class ProfileUser {
  final int userId;
  final int id;
  final String title;
  final String body;

  ProfileUser({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ProfileUser.fromJson(Map<String,dynamic> json) => _$ProfileUserFromJson (json);
  Map<String, dynamic> toJson() => _$ProfileUserToJson(this);
}