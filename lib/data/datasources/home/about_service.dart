import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'dart:convert';

import 'package:member_humic/data/models/respons/About/aboutmember_response.dart';

class MemberService {
  Future<AboutMemberResponse> fetchAbout() async {
    final url = Uri.parse('${Variables.baseUrl}/api/about');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return AboutMemberResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load members');
    }
  }

  Future<User> fetchMemberDetail(int id) async {
    final url = Uri.parse('${Variables.baseUrl}/api/member/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load member details');
    }
  }
}
