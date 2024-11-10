import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:path/path.dart' as path;

class AnnouncementService {
  Future<void> createAnnouncement(
    String title,
    String description,
    String date,
    String time,
    List<File> files,
  ) async {
    final uri = Uri.parse('${Variables.baseUrl}/api/announcements');
    final authData = await AuthLocalDatasource().getAuthData();
    final token = authData.token;

    var request = http.MultipartRequest('POST', uri);
    
    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });

    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['date'] = date;
    request.fields['time'] = time;

    for (var file in files) {
      final extension = path.extension(file.path).toLowerCase();
      MediaType mediaType;
      switch (extension) {
        case '.png':
          mediaType = MediaType('image', 'png');
          break;
        case '.jpg':
        case '.jpeg':
          mediaType = MediaType('image', 'jpeg');
          break;
        case '.gif':
          mediaType = MediaType('image', 'gif');
          break;
        default:
          throw Exception('Unsupported file type: $extension');
      }

      request.files.add(await http.MultipartFile.fromPath(
        'uploaded_files[]',
        file.path,
        contentType: mediaType,
      ));
    }

    final response = await request.send();

    if (response.statusCode == 201) {
      // Penanganan sukses
      print('Pengumuman berhasil dibuat.');
    } else {
      // Tangkap error detail dari response
      final responseData = await response.stream.bytesToString();
      print('Gagal membuat pengumuman: $responseData');
      throw Exception('Gagal membuat pengumuman');
    }
  }
}
