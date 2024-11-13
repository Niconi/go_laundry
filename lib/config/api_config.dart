class ApiConfig {
  static const String baseUrl = "http://192.168.100.129:3000";

  static String registerEndpoint() => "$baseUrl/register";
  static String loginEndpoint() => "$baseUrl/login";
}
