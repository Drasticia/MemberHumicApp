import 'dart:convert';

class ProjectGalleryHomeModel {
    final bool success;
    final List<ProjectG> data;

    ProjectGalleryHomeModel({
        required this.success,
        required this.data,
    });

    factory ProjectGalleryHomeModel.fromRawJson(String str) => ProjectGalleryHomeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectGalleryHomeModel.fromJson(Map<String, dynamic> json) => ProjectGalleryHomeModel(
        success: json["success"],
        data: List<ProjectG>.from(json["data"].map((x) => ProjectG.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProjectG {
    final int id;
    final String title;
    final String description;
    final DateTime date;
    final String comment;
    final int userId;
    final String status;
    final String thumbnail;
    final DateTime createdAt;
    final DateTime updatedAt;

    ProjectG({
        required this.id,
        required this.title,
        required this.description,
        required this.date,
        required this.comment,
        required this.userId,
        required this.status,
        required this.thumbnail,
        required this.createdAt,
        required this.updatedAt,
    });

    factory ProjectG.fromRawJson(String str) => ProjectG.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectG.fromJson(Map<String, dynamic> json) => ProjectG(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        comment: json["comment"],
        userId: json["user_id"],
        status: json["status"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "comment": comment,
        "user_id": userId,
        "status": status,
        "thumbnail": thumbnail,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
