import 'dart:convert';

class StaticModel {
    final int totalDepartments;
    final int totalFaculties;
    final int totalBranches;
    final List<UsersGroupedByYear> usersGroupedByYear;
    final List<ActiveUsersGroupedByYear> activeUsersGroupedByYear;
    final int totalActive;

    StaticModel({
        required this.totalDepartments,
        required this.totalFaculties,
        required this.totalBranches,
        required this.usersGroupedByYear,
        required this.activeUsersGroupedByYear,
        required this.totalActive,
    });

    factory StaticModel.fromRawJson(String str) => StaticModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory StaticModel.fromJson(Map<String, dynamic> json) => StaticModel(
        totalDepartments: json["totalDepartments"],
        totalFaculties: json["totalFaculties"],
        totalBranches: json["totalBranches"],
        usersGroupedByYear: List<UsersGroupedByYear>.from(json["usersGroupedByYear"].map((x) => UsersGroupedByYear.fromJson(x))),
        activeUsersGroupedByYear: List<ActiveUsersGroupedByYear>.from(json["activeUsersGroupedByYear"].map((x) => ActiveUsersGroupedByYear.fromJson(x))),
        totalActive: json["totalActive"],
    );

    Map<String, dynamic> toJson() => {
        "totalDepartments": totalDepartments,
        "totalFaculties": totalFaculties,
        "totalBranches": totalBranches,
        "usersGroupedByYear": List<dynamic>.from(usersGroupedByYear.map((x) => x.toJson())),
        "activeUsersGroupedByYear": List<dynamic>.from(activeUsersGroupedByYear.map((x) => x.toJson())),
        "totalActive": totalActive,
    };
}

class ActiveUsersGroupedByYear {
    final int year;
    final int activeMembers;

    ActiveUsersGroupedByYear({
        required this.year,
        required this.activeMembers,
    });

    factory ActiveUsersGroupedByYear.fromRawJson(String str) => ActiveUsersGroupedByYear.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ActiveUsersGroupedByYear.fromJson(Map<String, dynamic> json) => ActiveUsersGroupedByYear(
        year: json["year"] ?? 0,
        activeMembers: json["active_members"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "active_members": activeMembers,
    };
}

class UsersGroupedByYear {
    final int year;
    final int totalMembers;

    UsersGroupedByYear({
        required this.year,
        required this.totalMembers,
    });

    factory UsersGroupedByYear.fromRawJson(String str) => UsersGroupedByYear.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsersGroupedByYear.fromJson(Map<String, dynamic> json) => UsersGroupedByYear(
        year: json["year"] ?? 0,
        totalMembers: json["total_members"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "total_members": totalMembers,
    };
}
