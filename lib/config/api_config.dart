import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiConfig {
  static const String baseUrl = "https://api0.apigolaundry.online";

  static String registerEndpoint() => "$baseUrl/register";
  static String loginEndpoint() => "$baseUrl/login";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  static final _secureStorage = const FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  static Future<void> clearToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }

  static Future<Map<String, String>> getAuthHeaders() async {
    final token = await getToken();
    if (token != null) {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    } else {
      return headers;
    }
  }
}
