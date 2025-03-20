import 'dart:convert';

SessionIdModel sessionIdModelFromJson(String str) =>
    SessionIdModel.fromJson(json.decode(str));

String SessionIdModelToJson(SessionIdModel data) => json.encode(data.toJson());

class SessionIdModel {
  final String sessionId;

  SessionIdModel({required this.sessionId});

  factory SessionIdModel.fromJson(Map<String, dynamic> json) =>
      SessionIdModel(sessionId: json["sessionId"]);

  Map<String, dynamic> toJson() => {"sessionId": sessionId};
}
