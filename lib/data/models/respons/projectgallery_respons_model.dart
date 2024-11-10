import 'dart:convert';

class ProjectGalleryResponse {
  final bool success;
  final String message;
  final Data? data;

  ProjectGalleryResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ProjectGalleryResponse.fromRawJson(String str) =>
      ProjectGalleryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProjectGalleryResponse.fromJson(Map<String, dynamic> json) =>
      ProjectGalleryResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int id;
  final String title;
  final String description;
  final DateTime? date;
  final String? comment;
  final int userId;
  final String status;
  final String? thumbnail;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.description,
    this.date,
    this.comment,
    required this.userId,
    required this.status,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? 0 ,
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        date: json["date"] != null ? DateTime.tryParse(json["date"]) : null,
        comment: json["comment"] ?? '',
        userId: json["user_id"] ?? 0,
        status: json["status"] ?? 'Unknown',
        thumbnail: json["thumbnail"] ?? '',
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date != null
            ? "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}"
            : null,
        "comment": comment,
        "user_id": userId,
        "status": status,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
