class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();

  static String baseUrl = "https://www.calif.in/app/api/";
  static String appLocale = 'en';
  static String? authToken;
  static bool get isAuthorized => (AppConfig.authToken ?? '').isNotEmpty;
  // static String googleMapApiKey = "AIzaSyD3Cv8BHPMSw8DMWLbZYWwDejNm6E9oK1U";
}
