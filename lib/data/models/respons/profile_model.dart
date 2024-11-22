import 'dart:convert';

class ProfileModel {
    final bool success;
    final Profile data;

    ProfileModel({
        required this.success,
        required this.data,
    });

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        data: Profile.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Profile {
    final int id;
    final String name;
    final int nip;
    final String faculty;
    final String department;
    final int handphone;
    final DateTime birthday;
    final int gender;
    final String religion;
    final String address;
    final String profilePicture;
    final List<EduBackground> eduBackground;
    final int status;

    Profile({
        required this.id,
        required this.name,
        required this.nip,
        required this.faculty,
        required this.department,
        required this.handphone,
        required this.birthday,
        required this.gender,
        required this.religion,
        required this.address,
        required this.profilePicture,
        required this.eduBackground,
        required this.status,
    });

    factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        nip: json["NIP"],
        faculty: json["faculty"],
        department: json["department"],
        handphone: json["handphone"],
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"],
        religion: json["religion"],
        address: json["address"],
        profilePicture: json["profile_picture"],
        eduBackground: List<EduBackground>.from(json["eduBackground"].map((x) => EduBackground.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "NIP": nip,
        "faculty": faculty,
        "department": department,
        "handphone": handphone,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "religion": religion,
        "address": address,
        "profile_picture": profilePicture,
        "eduBackground": List<dynamic>.from(eduBackground.map((x) => x.toJson())),
        "status": status,
    };
}

class EduBackground {
    final int id;
    final int userId;
    final String level;
    final String major;
    final String institution;
    final DateTime createdAt;
    final DateTime updatedAt;

    EduBackground({
        required this.id,
        required this.userId,
        required this.level,
        required this.major,
        required this.institution,
        required this.createdAt,
        required this.updatedAt,
    });

    factory EduBackground.fromRawJson(String str) => EduBackground.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EduBackground.fromJson(Map<String, dynamic> json) => EduBackground(
        id: json["id"],
        userId: json["user_id"],
        level: json["level"],
        major: json["major"],
        institution: json["institution"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "level": level,
        "major": major,
        "institution": institution,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}