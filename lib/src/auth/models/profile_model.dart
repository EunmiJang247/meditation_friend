import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final int id;
  final String username;

  ProfileModel({required this.id, required this.username});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      ProfileModel(id: json["id"], username: json["username"]);

  Map<String, dynamic> toJson() => {"id": id, "username": username};
}
