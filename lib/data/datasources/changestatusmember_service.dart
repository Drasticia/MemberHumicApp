import 'package:http/http.dart' as http;
import 'package:member_humic/core/constant/variable.dart';
import 'package:member_humic/data/datasources/auth_local_datasource.dart';
import 'package:member_humic/data/models/respons/change_status_model.dart';

class ChangeStatusMemberService {
  Future<ChangeStatusMember> changeStatus(int userId) async {
    final url = Uri.parse('${Variables.baseUrl}/api/user/$userId/status');
    final authData = await AuthLocalDatasource().getAuthData();
    
     try {
      final response = await http.patch(
        url,
        headers: {
          'Authorization': 'Bearer ${authData.token}',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return ChangeStatusMember.fromRawJson(response.body);
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else if (response.statusCode == 401) {
        throw Exception('Unauthorized request');
      } else {
        throw Exception('Failed to change status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('An error occurred: $error');
    }
  }
}
