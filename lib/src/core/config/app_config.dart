class AppConfig {
  final String baseAccountUrl = "https://accounts.spotify.com/api/token";
  final String baseUrl = "https://api.spotify.com/v1";
  final String clientId = "-";
  final String clientSecret = "-";

  static final AppConfig instance = AppConfig._internal();

  AppConfig._internal();

  factory AppConfig() => instance;
}
