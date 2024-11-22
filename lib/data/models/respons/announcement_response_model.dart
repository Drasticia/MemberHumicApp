import 'dart:convert';

class AnnouncementResponse {
    final String status;
    final String message;
    final Announcement announcement;

    AnnouncementResponse({
        required this.status,
        required this.message,
        required this.announcement,
    });

    factory AnnouncementResponse.fromRawJson(String str) => AnnouncementResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnnouncementResponse.fromJson(Map<String, dynamic> json) => AnnouncementResponse(
        status: json["status"],
        message: json["message"],
        announcement: Announcement.fromJson(json["announcement"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "announcement": announcement.toJson(),
    };
}

class Announcement {
    final String title;
    final String desc;
    final DateTime date;
    final String time;
    final DateTime updatedAt;
    final DateTime createdAt;
    final int id;

    Announcement({
        required this.title,
        required this.desc,
        required this.date,
        required this.time,
        required this.updatedAt,
        required this.createdAt,
        required this.id,
    });

    factory Announcement.fromRawJson(String str) => Announcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        title: json["title"],
        desc: json["desc"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
    };
}
