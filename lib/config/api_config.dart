class ApiConfig {
  static const String baseUrl = "https://api1.apigolaundry.online";

  static String registerEndpoint() => "$baseUrl/register";
  static String loginEndpoint() => "$baseUrl/login";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };
}
