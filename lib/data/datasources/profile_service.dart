import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/models/respons/userprofile_model.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';

class ProfileService {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();

  Future<UserProfile> getUserProfile() async {
    final uri = Uri.parse('${Variables.baseUrl}/api/memberprofile');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    try {
      final response = await http.get(uri, headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        final userProfile = UserProfile.fromJson(jsonDecode(response.body));
        await authLocalDatasource.saveUserProfile(userProfile);
        return userProfile;
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized: Please log in again.');
      } else {
        throw Exception('Failed to load profile');
      }
    } on SocketException {
      throw Exception('Network error: Please check your internet connection.');
    }
  }

  Future<void> updateUserProfile(Data updatedUser, File? imageFile) async {
    final uri = Uri.parse(
        '${Variables.baseUrl}/api/memberprofile/update/${updatedUser.id}');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;
    String _getMimeType(String filePath) {
      final ext = path.extension(filePath).toLowerCase();
      switch (ext) {
        case '.png':
          return 'image/png';
        case '.jpg':
        case '.jpeg':
          return 'image/jpeg';
        case '.gif':
          return 'image/gif';
        default:
          throw Exception('Unsupported file type: $ext');
      }
    }

    if (imageFile != null && await imageFile.exists()) {
      final mimeType = _getMimeType(imageFile.path);

      final request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $token'
        ..headers['Accept'] = 'application/json';

      request.fields.addAll({
        'name': updatedUser.name,
        'NIP': updatedUser.NIP,
        'faculty': updatedUser.faculty,
        'department': updatedUser.department,
        'handphone': updatedUser.handphone,
        'birthday': updatedUser.birthday,
        'gender': updatedUser.gender.toString(),
        'religion': updatedUser.religion,
        'address': updatedUser.address,
      });

      for (int i = 0; i < updatedUser.eduBackground.length; i++) {
        request.fields['level[$i]'] = updatedUser.eduBackground[i].level;
        request.fields['major[$i]'] = updatedUser.eduBackground[i].major;
        request.fields['institution[$i]'] =
            updatedUser.eduBackground[i].institution;
      }

      request.files.add(await http.MultipartFile.fromPath(
        'profile_picture',
        imageFile.path,
        contentType: MediaType.parse(mimeType),
      ));

      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode != 200) {
        throw Exception('Failed to update profile: $responseBody');
      }
    } else {
      final body = {
        'name': updatedUser.name,
        'NIP': updatedUser.NIP,
        'faculty': updatedUser.faculty,
        'department': updatedUser.department,
        'handphone': updatedUser.handphone,
        'birthday': updatedUser.birthday,
        'gender': updatedUser.gender.toString(),
        'religion': updatedUser.religion,
        'address': updatedUser.address,
        'level': updatedUser.eduBackground.map((edu) => edu.level).toList(),
        'major': updatedUser.eduBackground.map((edu) => edu.major).toList(),
        'institution':
            updatedUser.eduBackground.map((edu) => edu.institution).toList(),
      };

      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update profile: ${response.body}');
      }
    }
  }
}
