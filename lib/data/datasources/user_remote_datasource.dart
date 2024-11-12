import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/data/models/request/user_request_model.dart';

class UserRemoteDatasource {
  Future<Either<String, MemberRespons>> getMembers({
    required int page,
    required int entriesPerPage,
    String? searchQuery,
    String? selectedProdi,
    String? selectedFaculty,
    String? selectedBranch,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        'limit': entriesPerPage.toString(),
        if (searchQuery != null && searchQuery.isNotEmpty) 'search': searchQuery,
        if (selectedProdi != null) 'department': selectedProdi,
        if (selectedFaculty != null) 'faculty': selectedFaculty,
        if (selectedBranch != null) 'branch': selectedBranch,
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/members').replace(queryParameters: queryParams);

      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${authData.token}',
        },
      );

      // Logging status dan body response untuk debugging
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return right(MemberRespons.fromJson(jsonData));
      } else {
        return left('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
      return left('Terjadi kesalahan saat memuat data produk.');
    }
  }
  Future<Either<String, String>> addMember({
    required String name,
    required String username,
    required String email,
    required String branch,
    required String password,
    required String retypePassword,
  }) async {
    try {
      final uri = Uri.parse('${Variables.baseUrl}/api/members');
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer ${authData.token}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'username': username,
          'email': email,
          'branch': branch,
          'password': password,
          'retype_password': retypePassword,
        }),
      );

      // Logging status dan body response untuk debugging
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        return right('Member successfully added.');
      } else {
        // Return error message from the response body if available
        final errorResponse = jsonDecode(response.body);
        return left(errorResponse['error'] ?? 'Failed to add member.');
      }
    } catch (e) {
      print('Error: $e');
      return left('Terjadi kesalahan saat menambahkan member.');
    }
  }
  Future<Either<String, String>> deleteMember(int id) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.delete(
        Uri.parse('${Variables.baseUrl}/api/members/$id'),
        headers: {
          'Authorization': 'Bearer ${authData.token}',
        },
      );

      if (response.statusCode == 200) {
        return right("Member deleted successfully.");
      } else {
        return left("Failed to delete member: ${response.reasonPhrase}");
      }
    } catch (e) {
      return left("An error occurred: $e");
    }
  }
}