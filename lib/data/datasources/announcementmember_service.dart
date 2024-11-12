import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/data/models/request/announcement_model.dart';

class AnnouncementServiceMember {
  final String baseUrl;
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();

  AnnouncementServiceMember(this.baseUrl);

  Future<List<Announcement>> fetchAnnouncements() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/member/announcements');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    print('Token: $token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final announcements = AnouncementModel.fromJson(json).announcements;
      return announcements;
    } else {
      throw Exception('Failed to load announcements');
    }
  }
}
