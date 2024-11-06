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
      // Membuat URI dengan query parameters
      final queryParams = {
        'page': page.toString(),
        'limit': entriesPerPage.toString(),
        if (searchQuery != null && searchQuery.isNotEmpty) 'search': searchQuery,
        if (selectedProdi != null) 'department': selectedProdi,
        if (selectedFaculty != null) 'faculty': selectedFaculty,
        if (selectedBranch != null) 'branch': selectedBranch,
      };
      final uri = Uri.parse('${Variables.baseUrl}/api/members').replace(queryParameters: queryParams);

      // Mendapatkan token dari AuthLocalDatasource
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
}
