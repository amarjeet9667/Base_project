import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  static const String _tokenKey = "auth_token";

  //...........Save token to SharedPreferences...............
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  //...........Get token from SharedPreferences..............
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  //...........Delete token (on logout).....................
  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
