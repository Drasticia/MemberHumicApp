import 'dart:convert';
import 'package:member_humic/data/models/respons/auth_response_model.dart';
import 'package:member_humic/data/models/respons/userprofile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource{
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', jsonEncode(authResponseModel.toJson()));
  }

  Future<void> saveUserProfile(UserProfile userProfile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_profile', jsonEncode(userProfile.toJson()));
  }

  Future<void> removeAuthData() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
    await prefs.remove('user_profile');
  }

  Future<AuthResponseModel> getAuthData() async{
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');

    if (authData != null) {
      return AuthResponseModel.fromJson(jsonDecode(authData));
    } else {
      throw Exception('No auth data found');
    }
  }


  Future<bool> isAuth() async{
    final prefs = await SharedPreferences.getInstance();
    final autoData = prefs.getString('auth_data');

    return autoData != null;
  }

  
}