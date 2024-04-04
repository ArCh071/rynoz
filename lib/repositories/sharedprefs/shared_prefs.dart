import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? preferences;
  SharedPrefs() {
    _initializeSharedPrefs();
  }

  _initializeSharedPrefs() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  static const authToken = "authToken";
  // static const phone = "phone";

  Future<String?> getAuthToken() async {
    String? stringValue = preferences?.getString(authToken);
    return stringValue;
  }

  Future<String?> getphone() async {
    String? stringValue = preferences?.getString("phone");
    return stringValue;
  }

  Future<void> saveAuthToken({required String token}) async {
    await preferences?.setString(authToken, token);
  }

  Future<void> savephone({required String phone}) async {
    await preferences?.setString("phone", phone);
  }

  Future<void> clearToken() async {
    await preferences?.remove("phone");
    await preferences?.remove("authToken");
  }
}
