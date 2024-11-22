import 'dart:convert';

class AboutMemberResponse {
    final List<User> userOne;
    final List<User> userTwo;
    final List<User> userThree;

    AboutMemberResponse({
        required this.userOne,
        required this.userTwo,
        required this.userThree,
    });

    factory AboutMemberResponse.fromRawJson(String str) => AboutMemberResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AboutMemberResponse.fromJson(Map<String, dynamic> json) => AboutMemberResponse(
        userOne: List<User>.from(json["userOne"].map((x) => User.fromJson(x))),
        userTwo: List<User>.from(json["userTwo"].map((x) => User.fromJson(x))),
        userThree: List<User>.from(json["userThree"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userOne": List<dynamic>.from(userOne.map((x) => x.toJson())),
        "userTwo": List<dynamic>.from(userTwo.map((x) => x.toJson())),
        "userThree": List<dynamic>.from(userThree.map((x) => x.toJson())),
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
    final String profilePicture;
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
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      faculty: json["faculty"] ?? "",
      department: json["department"] ?? "",
      handphone: json["handphone"] ?? 0,
      religion: json["religion"] ?? "",
      gender: json["gender"] ?? 0,
      address: json["address"] ?? "",
      birthday: json["birthday"] != null ? DateTime.parse(json["birthday"]) : DateTime(1970, 1, 1),
      status: json["status"] ?? 0,
      nip: json["NIP"] ?? 0,
      position: json["position"] ?? 0,
      profilePicture: json["profile_picture"] ?? "",
      positionName: json["position_name"] ?? "",
      isAdmin: json["isAdmin"] ?? 0,
      emailVerifiedAt: json["email_verified_at"],
      code: json["code"],
      branch: json["branch"] ?? "",
      createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime(1970, 1, 1),
      updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime(1970, 1, 1),
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
