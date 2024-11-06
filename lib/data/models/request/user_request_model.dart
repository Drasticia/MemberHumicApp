import 'package:meta/meta.dart';
import 'dart:convert';

class MemberRespons {
  final bool success;
  final String message;
  final List<Member> data;

  MemberRespons({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MemberRespons.fromRawJson(String str) =>
      MemberRespons.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberRespons.fromJson(Map<String, dynamic> json) => MemberRespons(
        success: json["success"],
        message: json["message"],
        data: List<Member>.from(json["data"].map((x) => Member.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Member {
  final int id;
  final String name;
  final String username;
  final String email;
  final String faculty;
  final String department;
  final int handphone;
  final String religion;
  final int gender;
  final String address;
  final DateTime birthday;
  final int status;
  final int nip;
  final int position;
  final String profilePicture;
  final String positionName;
  final int isAdmin;
  final dynamic emailVerifiedAt;
  final dynamic code;
  final String branch;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  Member({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.faculty,
    required this.department,
    required this.handphone,
    required this.religion,
    required this.gender,
    required this.address,
    required this.birthday,
    required this.status,
    required this.nip,
    required this.position,
    required this.profilePicture,
    required this.positionName,
    required this.isAdmin,
    required this.emailVerifiedAt,
    required this.code,
    required this.branch,
    this.createdAt,
    this.updatedAt,
    required this.deletedAt,
  });

  factory Member.fromRawJson(String str) => Member.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        name: json["name"]?? '',
        username: json["username"]?? '',
        email: json["email"]?? '',
        faculty: json["faculty"] ?? '',
        department: json["department"] ?? '',
        handphone: json["handphone"] ?? 0,
        religion: json["religion"] ?? '',
        gender: json["gender"] ?? 0,
        address: json["address"] ?? '',
        birthday: json["birthday"] != null && json["birthday"] != ''
            ? DateTime.parse(json["birthday"])
            : DateTime(1970, 1, 1), // Default date if null
        status: json["status"],
        nip: json["NIP"] ?? 0,
        position: json["position"] ?? 0,
        profilePicture: json["profile_picture"] ?? '',
        positionName: json["position_name"] ?? '',
        isAdmin: json["isAdmin"] ?? 0,
        emailVerifiedAt: json["email_verified_at"] ,
        code: json["code"],
        branch: json["branch"]?? '',
        createdAt: json["created_at"] != null && json["created_at"] != ''
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null && json["updated_at"] != ''
            ? DateTime.parse(json["updated_at"])
            : null,
        deletedAt: json["deleted_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "faculty": faculty,
        "department": department,
        "handphone": handphone,
        "religion": religion,
        "gender": gender,
        "address": address,
        "birthday":
            "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "status": status,
        "NIP": nip,
        "position": position,
        "profile_picture": profilePicture,
        "position_name": positionName,
        "isAdmin": isAdmin,
        "email_verified_at": emailVerifiedAt,
        "code": code,
        "branch": branch,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
      };
}