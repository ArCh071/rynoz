import 'package:either_dart/either.dart';
import 'package:rynoz/repositories/network/response_error.dart';

abstract class BaseServices {
  // Future<Either<ResponseError, dynamic>> verifyOtp(
  //     {String? phone, String? otp});
  Future<Either<ResponseError, dynamic>> login(
      {String? memberid, String? password});
}
