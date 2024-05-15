import 'package:get_it/get_it.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;
  AppConfig._internal();
  final sharedPrefs = GetIt.instance<SharedPrefs>();
  static String baseUrl = "http://103.38.50.51/api/";
  static String appLocale = 'en';
  static String? id;
  static String? name;
  static String? phone;
  static String? address;
  static String? state;
  static String? nation;
  static String? pin;
  static String? email;
  static String? icon;
  // static bool get isAuthorized => (AppConfig.authToken ?? '').isNotEmpty;
  // static String googleMapApiKey = "AIzaSyD3Cv8BHPMSw8DMWLbZYWwDejNm6E9oK1U";
}
