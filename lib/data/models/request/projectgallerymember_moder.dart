import 'package:meta/meta.dart';
import 'dart:convert';

class ProjectGalleryMemberModel {
    final List<ProjectGallery> projectGallery;

    ProjectGalleryMemberModel({
        required this.projectGallery,
    });

    factory ProjectGalleryMemberModel.fromRawJson(String str) => ProjectGalleryMemberModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectGalleryMemberModel.fromJson(Map<String, dynamic> json) => ProjectGalleryMemberModel(
        projectGallery: List<ProjectGallery>.from(json["project_gallery"].map((x) => ProjectGallery.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "project_gallery": List<dynamic>.from(projectGallery.map((x) => x.toJson())),
    };
}

class ProjectGallery {
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

    ProjectGallery({
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

    factory ProjectGallery.fromRawJson(String str) => ProjectGallery.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProjectGallery.fromJson(Map<String, dynamic> json) => ProjectGallery(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        comment: json["comment"]?? '',
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
