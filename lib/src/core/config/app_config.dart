class AppConfig {
  final String baseAccountUrl = "https://accounts.spotify.com";
  final String baseUrl = "https://api.spotify.com/v1";
  final String clientId = "-";
  final String clientSecret = "-";
  final String redirectUrl = "http://localhost:8080/callback";

  static final AppConfig instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() => instance;
}
