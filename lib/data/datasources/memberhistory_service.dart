import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/data/models/respons/memberhistory_respons.dart';

class MemberHistoryService {
  final String baseUrl;
  final AuthLocalDatasource authLocalDatasource; 

  MemberHistoryService(this.baseUrl, this.authLocalDatasource);

  Future<List<MemberHistory>> fetchMemberHistory({String? search, int entries = 10, bool ascending = true}) async {
    final uri = Uri.parse('${Variables.baseUrl}/api/member-history').replace(
      queryParameters: {
        'search': search,
        'entries': entries.toString(),
        
      },
    );

    try {
      final authData = await authLocalDatasource.getAuthData();
      final token = authData.token;

      print('Fetching from: $uri with token: $token');

      final response = await http
          .get(
            uri,
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List;
        return data.map((json) => MemberHistory.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load member history');
      }
    } on TimeoutException {
      throw Exception('Request timeout. Please try again.');
    } catch (error) {
      throw Exception('Error fetching member history: $error');
    }
  }
}

