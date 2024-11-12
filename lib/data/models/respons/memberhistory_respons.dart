import 'dart:convert';
import 'package:member_humic/data/models/respons/auth_response_model.dart';

class MemberHistory {
  final int id;
  final int? userId;
  final String loginAt;
  final String ipAddress;
  final String userAgent;
  final String createdAt;
  final String updatedAt;
  final User? user;

  MemberHistory({
    required this.id,
    required this.userId,
    required this.loginAt,
    required this.ipAddress,
    required this.userAgent,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory MemberHistory.fromRawJson(String str) => MemberHistory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberHistory.fromJson(Map<String, dynamic> json) => MemberHistory(
        id: json["id"] ?? 0,
        userId: json["user_id"],
        loginAt: json["login_at"]?? '',
        ipAddress: json["ip_address"] ?? '',
        userAgent: json["user_agent"]?? '',
        createdAt: json["created_at"]?? '',
        updatedAt: json["updated_at"]?? '',
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "login_at": loginAt,
        "ip_address": ipAddress,
        "user_agent": userAgent,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "user": user?.toJson() ?? {},
      };
}
