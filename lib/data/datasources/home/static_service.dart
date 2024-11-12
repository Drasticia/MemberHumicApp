import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/models/respons/static_response_model.dart';

class StatisticsService {
  Future<StaticModel?> fetchStatistics() async {
    try {
      final response = await http.get(Uri.parse('${Variables.baseUrl}/api/home'));

      if (response.statusCode == 200) {
        return StaticModel.fromJson(json.decode(response.body));
      } else {
        print('Failed to load statistics: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching statistics: $e');
      return null;
    }
  }
}
