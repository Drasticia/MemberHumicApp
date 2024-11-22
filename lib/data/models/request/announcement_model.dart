import 'dart:convert';

class AnouncementModel {
    final List<Announcement> announcements;

    AnouncementModel({
        required this.announcements,
    });

    factory AnouncementModel.fromRawJson(String str) => AnouncementModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnouncementModel.fromJson(Map<String, dynamic> json) => AnouncementModel(
        announcements: List<Announcement>.from(json["announcements"].map((x) => Announcement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "announcements": List<dynamic>.from(announcements.map((x) => x.toJson())),
    };
}

class Announcement {
    final int id;
    final String title;
    final String desc;
    final DateTime date;
    final String time;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<AnnouncementImage> images;

    Announcement({
        required this.id,
        required this.title,
        required this.desc,
        required this.date,
        required this.time,
        required this.createdAt,
        required this.updatedAt,
        required this.images,
    });

    factory Announcement.fromRawJson(String str) => Announcement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        images: json["images"] == null
            ? []
            : List<AnnouncementImage>.from(json["images"].map((x) => AnnouncementImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "desc": desc,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}

class AnnouncementImage {
    final int id;
    final int announcementId;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    AnnouncementImage({
        required this.id,
        required this.announcementId,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AnnouncementImage.fromRawJson(String str) => AnnouncementImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AnnouncementImage.fromJson(Map<String, dynamic> json) => AnnouncementImage(
        id: json["id"],
        announcementId: json["announcement_id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "announcement_id": announcementId,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
