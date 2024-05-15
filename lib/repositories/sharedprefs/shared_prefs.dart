import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? preferences;
  SharedPrefs() {
    _initializeSharedPrefs();
  }

  _initializeSharedPrefs() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  Future<String?> getid() async {
    String? stringValue = preferences?.getString("id");
    return stringValue;
  }

  Future<void> saveid({required String id}) async {
    await preferences?.setString("id", id);
  }

  Future<String?> getname() async {
    String? stringValue = preferences?.getString("name");
    return stringValue;
  }

  Future<void> savename({required String name}) async {
    await preferences?.setString("name", name);
  }

  Future<String?> getphone() async {
    String? stringValue = preferences?.getString("phone");
    return stringValue;
  }

  Future<void> savephone({required String phone}) async {
    await preferences?.setString("phone", phone);
  }

  Future<String?> getemail() async {
    String? stringValue = preferences?.getString("email");
    return stringValue;
  }

  Future<void> saveemmail({required String email}) async {
    await preferences?.setString("email", email);
  }

  Future<String?> getaddress() async {
    String? stringValue = preferences?.getString("address");
    return stringValue;
  }

  Future<void> saveaddress({required String address}) async {
    await preferences?.setString("address", address);
  }

  Future<String?> getnation() async {
    String? stringValue = preferences?.getString("nation");
    return stringValue;
  }

  Future<void> savenation({required String nation}) async {
    await preferences?.setString("nation", nation);
  }

  Future<String?> getstate() async {
    String? stringValue = preferences?.getString("state");
    return stringValue;
  }

  Future<void> savestate({required String state}) async {
    await preferences?.setString("state", state);
  }

  Future<String?> getpin() async {
    String? stringValue = preferences?.getString("pin");
    return stringValue;
  }

  Future<void> savepin({required String pin}) async {
    await preferences?.setString("pin", pin);
  }

  Future<String?> geticon() async {
    String? stringValue = preferences?.getString("icon");
    return stringValue;
  }

  Future<void> saveicon({required String icon}) async {
    await preferences?.setString("icon", icon);
  }

  Future<void> clearToken() async {
    await preferences?.clear();
  }
}
