import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/data/models/request/projectgallerymember_moder.dart';

class ProjectGalleryMemberService {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();
  Future<ProjectGalleryMemberModel> fetchProjectGallery() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/member/project-gallery');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return ProjectGalleryMemberModel.fromRawJson(response.body);
    } else {
      throw Exception('Failed to load project gallery');
    }
  }

  Future<ProjectGallery> addProjectGalleryItem({
    required String title,
    required String description,
    required String date,
    required File thumbnail,
  }) async {
    final uri = Uri.parse('${Variables.baseUrl}/api/member/project-gallery/add');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    var request = http.MultipartRequest(
      'POST',
      uri,
    );

    request.headers['Authorization'] = 'Bearer $token';

    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['date'] = date;

    request.files.add(
      await http.MultipartFile.fromPath(
        'thumbnail',
        thumbnail.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final json = jsonDecode(responseBody);
      return ProjectGallery.fromJson(json['project_gallery']);
    } else {
      throw Exception('Failed to add project gallery item');
    }
  }
}