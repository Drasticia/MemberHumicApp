import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/models/respons/userprofile_model.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';

class ProfileService {
  final String baseUrl;
  final AuthLocalDatasource authLocalDatasource;

  ProfileService(this.baseUrl, this.authLocalDatasource);

  Future<UserProfile> getUserProfile() async {
    final uri = Uri.parse('$baseUrl/api/memberprofile');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    final response = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final userProfile = UserProfile.fromJson(jsonDecode(response.body));
      // Simpan profile ke local storage
      await authLocalDatasource.saveUserProfile(userProfile);
      return userProfile;
    } else {
      // Debugging tambahan untuk mengetahui penyebab error
      print("Failed to load profile with status: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception('Failed to load profile');
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> profileData, {String? profilePicturePath}) async {
    final userId = profileData['id'];
    if (userId == null) {
      throw Exception('User ID is required for profile update');
    }

    final uri = Uri.parse('$baseUrl/api/memberprofile/$userId');
    final authData = await authLocalDatasource.getAuthData();
    final token = authData.token;

    // Debugging
    print("Token: $token");
    print("Profile data to update: $profileData");

    // Menggunakan MultipartRequest untuk mendukung file upload
    var request = http.MultipartRequest('PUT', uri);
    request.headers['Authorization'] = 'Bearer $token';
    request.headers['Accept'] = 'application/json';

    // Menambahkan field yang bukan `profile_picture`
    profileData.forEach((key, value) {
      if (key != 'profile_picture') {
        request.fields[key] = value.toString();
      }
    });

    // Menambahkan `profile_picture` jika disediakan
    if (profilePicturePath != null) {
      request.files.add(await http.MultipartFile.fromPath('profile_picture', profilePicturePath));
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final updatedProfile = UserProfile.fromJson(jsonDecode(response.body));
      await authLocalDatasource.saveUserProfile(updatedProfile);
    } else {
      print("Failed to update profile with status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Response headers: ${response.headers}");
      throw Exception('Failed to update profile');
    }
  }
}
