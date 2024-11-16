class ApiConfig {
  static const String baseUrl = "https://api0.apigolaundry.online";

  static String registerEndpoint() => "$baseUrl/register";
  static String loginEndpoint() => "$baseUrl/login";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };
}
