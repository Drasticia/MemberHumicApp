import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:member_humic/data/models/respons/projectgallery_respons_model.dart';
import 'auth_local_datasource.dart';
import 'package:member_humic/core/constant/variable.dart';

class ProjectGalleryService {
  final AuthLocalDatasource authLocalDatasource = AuthLocalDatasource();

  // Mendapatkan daftar project gallery
  Future<Either<String, List<Data>>> getProjectGalleryList() async {
  try {
    final uri = Uri.parse('${Variables.baseUrl}/api/project-gallery');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    print('Fetching from: $uri with token: $token');

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.headers['content-type']?.contains('application/json') == true) {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<Data> items = (jsonData['data'] as List)
            .map((item) => Data.fromJson(item))
            .toList();
        return right(items);
      } else {
        return left('Error: ${response.reasonPhrase}');
      }
    } else {
      throw Exception('Unexpected response format: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
    return left('Terjadi kesalahan: $e');
  }
}



  // Mendapatkan detail project untuk persetujuan
  Future<Either<String, Data>> getProjectGalleryDetail(int id) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/project-gallery/$id');
      final authData = await authLocalDatasource.getAuthData();
      final token = authData.token; // Pastikan token adalah string

      // Debugging log untuk memastikan token dan URI
      print('Fetching project gallery detail for ID: $id');
      print('Token: $token');

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Memastikan bahwa 'data' ada di dalam JSON respons
        if (jsonData['data'] == null) {
          return left('No Project Found');
        }

        // Parsing objek Data
        final Data item = Data.fromJson(jsonData['data']);
        return right(item);
      } else {
        // Mengembalikan error dengan informasi lebih lengkap
        return left('Error: ${response.reasonPhrase} - ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      return left('Terjadi kesalahan: $e');
    }
  }


  // Memperbarui status dan komentar project
  Future<Either<String, String>> updateProjectGalleryStatus({
    required int id,
    required String status,
    required String comment,
  }) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/project-gallery/$id/status');
      
      // Mendapatkan token sebagai string
      final authData = await authLocalDatasource.getAuthData();
      final token = authData.token; // Pastikan token diambil sebagai string

      print('Updating project gallery status for ID: $id with token: $token');

      final response = await http.put(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'status': status,
          'comment': comment,
        }),
      );

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      // Cek status kode untuk sukses
      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
        return right("Status dan komentar berhasil diperbarui.");
      } else {
        // Mengembalikan error dengan informasi lengkap dari `response.reasonPhrase` dan `response.body`
        return left('Error: ${response.reasonPhrase} - ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      return left('Terjadi kesalahan: $e');
    }
  }


}