class AppConfig {
  final String baseAccountUrl = "https://accounts.spotify.com";
  final String baseUrl = "https://api.spotify.com/v1";
  final String clientId = "66449d997fee4660b29e0036f39c96ce";
  final String clientSecret = "669a72cbc51c425d9f92ba83cf1a69d9";
  final String redirectUrl = "http://localhost:8080/callback";

  static final AppConfig instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() => instance;
}
