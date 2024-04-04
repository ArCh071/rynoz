import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rynoz/helper/appconfig.dart';
import 'package:rynoz/helper/helpers.dart';
import 'package:rynoz/repositories/network/base_service.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';

class AuthServices {
  final services = GetIt.instance<BaseServices>();
  final sharedPrefs = GetIt.instance<SharedPrefs>();
  Future<bool?> login({
    String? memeberid,
    String? password,
  }) async {
    print("$memeberid.....$password...");
    final res = await services.login(
      memberid: memeberid,
      password: password,
    );
//00CAL000   admin12
    if (res.isLeft) {
      print("not");
      Helpers.showToast(res.left.message ?? "");
      print(res.left.message);
      return false;
    } else if (res.isRight) {
      print("right");
      if (res.right["status"]) {
        print("correct");
        sharedPrefs.saveAuthToken(token: res.right["token"]);
        AppConfig.authToken = res.right["token"].toString();
        debugPrint(res.right["message"].toString());
        Helpers.showToast(res.right["message"].toString());
        return true;
      } else {
        print("falsee");
        return false;
      }
    } else {
      print("null");
      return null;
    }
  }

  // Future<bool?> verifyOtp({String? phone, String? otp}) async {
  //   final res = await services.verifyOtp(phone: phone, otp: otp);
  //   if (res.isLeft) {
  //     Helpers.showToast(res.left.message ?? "");
  //     return false;
  //   } else if (res.isRight) {
  //     if (res.right["status"]) {
  //       sharedPrefs.saveAuthToken(token: res.right["token"]);
  //       AppConfig.authToken = "Bearer ${res.right["token"]}";
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else {
  //     return null;
  //   }
  // }
}
