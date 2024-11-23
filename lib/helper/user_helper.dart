import 'package:shared_preferences/shared_preferences.dart';

class UserHelper {
  static Future<Map<String, String?>> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'user_name': prefs.getString('user_name'),
      'user_email': prefs.getString('user_email'),
      'user_phone': prefs.getString('user_phone'),
      'balance': prefs.getString('balance'),
    };
  }
}
