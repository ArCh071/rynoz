// import 'package:either_dart/either.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:rynoz/datamodel/login_datamodel.dart';
// import 'package:rynoz/helper/helpers.dart';
// import 'package:rynoz/helper/providerhelperclass.dart';
// import 'package:rynoz/repositories/network/base_service.dart';
// import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';

// class AuthServices extends ProviderHelperClass {
//   final services = GetIt.instance<BaseServices>();
//   final sharedPrefs = GetIt.instance<SharedPrefs>();

//   // Logindatamodel? logindata;
//   // Future<void> login({String? username, String? password}) async {
//   //   // updateVehicleTypeLoaderState(LoaderState.loading);
//   //   final network = await Helpers.isInternetAvailable();
//   //   if (network) {
//   //     await services.login(password: password, username: username).fold(
//   //       (left) {
//   //         logindata = null;
//   //         Helpers.showToast("${left.message}");
//   //         // updateVehicleTypeLoaderState(LoaderState.error);
//   //       },
//   //       (right) {
//   //         logindata = right;
//   //         sharedPrefs.saveid(id: "${logindata?.data![0].userId}");
//   //         print(logindata);
//   //         notifyListeners();
//   //       },
//   //     ).catchError((error) {
//   //       logindata = null;
//   //       debugPrint(error.toString());
//   //     });
//   //   } else {
//   //     logindata = null;
//   //     // updateVehicleTypeLoaderState(LoaderState.networkError);
//   //   }
//   // }

//   // Future<bool?> verifyOtp({String? phone, String? otp}) async {
//   //   final res = await services.verifyOtp(phone: phone, otp: otp);
//   //   if (res.isLeft) {
//   //     Helpers.showToast(res.left.message ?? "");
//   //     return false;
//   //   } else if (res.isRight) {
//   //     if (res.right["status"]) {
//   //       sharedPrefs.saveAuthToken(token: res.right["token"]);
//   //       AppConfig.authToken = "Bearer ${res.right["token"]}";
//   //       return true;
//   //     } else {
//   //       return false;
//   //     }
//   //   } else {
//   //     return null;
//   //   }
//   // }
// }
