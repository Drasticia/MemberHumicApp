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
    final DateTime? birthday;
    final int status;
    final int nip;
    final int position;
    final dynamic profilePicture;
    final String positionName;
    final int isAdmin;
    final dynamic emailVerifiedAt;
    final dynamic code;
    final String branch;
    final DateTime? createdAt;
    final DateTime? updatedAt;
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
        this.birthday,
        required this.status,
        required this.nip,
        required this.position,
        required this.profilePicture,
        required this.positionName,
        required this.isAdmin,
        this.emailVerifiedAt,
        this.code,
        required this.branch,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        faculty: json["faculty"] ?? '',
        department: json["department"] ?? '',
        handphone: json["handphone"] ?? 0,
        religion: json["religion"] ?? '',
        gender: json["gender"] ?? 0,
        address: json["address"] ?? '',
        birthday: json["birthday"] != null && json["birthday"] != ''
            ? DateTime.tryParse(json["birthday"])
            : null, // Set null if empty or null
        status: json["status"] ?? 0,
        nip: json["NIP"] ?? 0,
        position: json["position"] ?? 0,
        profilePicture: json["profile_picture"] ?? '',
        positionName: json["position_name"] ?? '',
        isAdmin: json["isAdmin"] ?? 0,
        emailVerifiedAt: json["email_verified_at"] ?? '',
        code: json["code"] ?? '',
        branch: json["branch"] ?? '',
        createdAt: json["created_at"] != null && json["created_at"] != ''
            ? DateTime.tryParse(json["created_at"])
            : null, // Set null if empty or null
        updatedAt: json["updated_at"] != null && json["updated_at"] != ''
            ? DateTime.tryParse(json["updated_at"])
            : null, // Set null if empty or null
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
        "birthday": birthday != null
            ? "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}"
            : null, // Set null if birthday is null
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
