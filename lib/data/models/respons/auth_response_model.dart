import 'dart:convert';

class AuthResponseModel {
    final User user;
    final String token;

    AuthResponseModel({
        required this.user,
        required this.token,
    });

    factory AuthResponseModel.fromRawJson(String str) => AuthResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
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
    final dynamic profilePicture;
    final String positionName;
    final int isAdmin;
    final dynamic emailVerifiedAt;
    final dynamic code;
    final String branch;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic deletedAt;

    User({
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
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        faculty: json["faculty"],
        department: json["department"],
        handphone: json["handphone"],
        religion: json["religion"],
        gender: json["gender"],
        address: json["address"],
        birthday: DateTime.parse(json["birthday"]),
        status: json["status"],
        nip: json["NIP"],
        position: json["position"],
        profilePicture: json["profile_picture"],
        positionName: json["position_name"],
        isAdmin: json["isAdmin"],
        emailVerifiedAt: json["email_verified_at"],
        code: json["code"],
        branch: json["branch"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
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
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "status": status,
        "NIP": nip,
        "position": position,
        "profile_picture": profilePicture,
        "position_name": positionName,
        "isAdmin": isAdmin,
        "email_verified_at": emailVerifiedAt,
        "code": code,
        "branch": branch,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
