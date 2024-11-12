import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/models/respons/projectgalleryhome_moder.dart';

class ProjectGService {
  Future<ProjectGalleryHomeModel> fetchApprovedProjects() async {
    final response = await http.get(Uri.parse('${Variables.baseUrl}/api/approved-projects'));

    if (response.statusCode == 200) {
      return ProjectGalleryHomeModel.fromRawJson(response.body);
    } else {
      throw Exception('Failed to load approved projects');
    }
  }
}