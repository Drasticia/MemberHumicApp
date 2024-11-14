import 'package:meta/meta.dart';
import 'dart:convert';

class ChangeStatusMember {
    final bool success;
    final String message;
    final Status data;

    ChangeStatusMember({
        required this.success,
        required this.message,
        required this.data,
    });

    factory ChangeStatusMember.fromRawJson(String str) => ChangeStatusMember.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChangeStatusMember.fromJson(Map<String, dynamic> json) => ChangeStatusMember(
        success: json["success"],
        message: json["message"],
        data: Status.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Status {
    final int id;
    final String name;
    final bool status;

    Status({
        required this.id,
        required this.name,
        required this.status,
    });

    factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
    };
}
