import 'package:either_dart/either.dart';
import 'package:rynoz/repositories/network/api_request.dart';
import 'package:rynoz/repositories/network/base_service.dart';
import 'package:rynoz/repositories/network/response_error.dart';

class Services implements BaseServices {
  // @override
  // Future<Either<ResponseError, dynamic>> verifyOtp(
  //     {String? phone, String? otp}) {
  //   final body = {"mobile_number": phone, "otp": otp};
  //   return safe(postRequest(endPoint: "customer/api/v2/verify-otp", body: body))
  //       .thenRight(checkHttpStatus)
  //       .thenRight(parseJson)
  //       .mapRight((right) => right);
  // }

  @override
  Future<Either<ResponseError, dynamic>> login(
      {String? memberid, String? password}) {
    Map<String, String> requestBody = <String, String>{
      "member_id": memberid.toString(),
      "password": password.toString(),
    };
    return safe(postRequest(endPoint: "login", body: requestBody))
        .thenRight(checkHttpStatus)
        .thenRight(parseJson)
        .mapRight((right) {
      print("ri...................$right");
      return right;
    });
  }
}
