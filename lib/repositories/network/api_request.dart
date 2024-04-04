import 'dart:convert';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:rynoz/helper/appconfig.dart';
import 'package:rynoz/helper/helpers.dart';
import 'package:rynoz/repositories/network/response_error.dart';
import 'package:rynoz/repositories/sharedprefs/shared_prefs.dart';

final sharedPrefs = GetIt.instance<SharedPrefs>();

Future<Either<ResponseError, http.Response>> safe(
    Future<http.Response> request) async {
  try {
    print(request);
    return Right(await request);
  } catch (e) {
    return Left(ResponseError(
        key: Error.badRequest, message: "Request executing with errors:$e"));
  }
}

Either<ResponseError, http.Response> checkHttpStatus(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return Right(response);

    case 400:
      {
        final body = jsonDecode(response.body);
        return Left(
            ResponseError(key: Error.badRequest, message: body["message"]));
      }

    case 401:
      {
        final body = jsonDecode(response.body);
        return Left(
            ResponseError(key: Error.badRequest, message: body["message"]));
      }

    case 404:
      {
        final body = jsonDecode(response.body);

        Helpers.showToast(body["message"]);
        return Left(
            ResponseError(key: Error.badRequest, message: body["message"]));
      }

    case 422:
      {
        final body = jsonDecode(response.body);
        print("............$body");
        return Left(
            ResponseError(key: Error.badRequest, message: body["message"]
                // ["errors"]["mobile_number"][0]
                ));
      }
    // case 500:
    //   {
    //     final body = jsonDecode(response.body);
    //     return Left(
    //         ResponseError(key: Error.badRequest, message: body["message"]
    //             // ["errors"]["mobile_number"][0]
    //             ));
    //   }

    case 500:
      return Left(ResponseError(
          key: Error.serverError,
          message: "Bad status ${response.statusCode}"));

    default:
      return Left(ResponseError(
          key: Error.badResponse,
          message: "Bad status ${response.statusCode}"));
  }
}

Future<Either<ResponseError, dynamic>> parseJson(http.Response response) async {
  try {
    return Right(json.decode(response.body));
  } catch (e) {
    return const Left(ResponseError(
        key: Error.jsonParsing, message: "Failed on json parsing"));
  }
}

Future<http.Response> getRequest({required String endPoint}) async {
  dynamic response;
  try {
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    Map<String, String> headers = <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    response = await http
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 30));
  } on Exception catch (error) {
    debugPrint(error.toString());
    if (error.toString().contains('SocketException')) {
      debugPrint("Error occurred while communicating with Server!");
    }
  }
  return response;
}

Future<http.Response> convertStringToResponse(String data,
    {int statusCode = 200}) async {
  return http.Response(data, statusCode);
}

Future<http.Response> postRequest(
    {required String endPoint, Map<String, String>? body}) async {
  dynamic response;
  try {
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    print(url);
    Map<String, String> headers = <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    print(body);
    // response = await http
    //     .post(url, headers: headers, body: jsonEncode(body))
    //     .timeout(const Duration(seconds: 30));
    var request = http.MultipartRequest('POST', url)..fields.addAll(body!);
    final resp = await request.send();
    final responseBody = await resp.stream.bytesToString();
    // response = await responseBody;
    print("str......$responseBody");
    response = convertStringToResponse(responseBody);
  } on Exception catch (error) {
    debugPrint(error.toString());
    if (error.toString().contains('SocketException')) {
      debugPrint("Error occurred while communicating with Server!");
    }
  }
  return response;
}

Future<http.Response> getRequestWithToken({required String endPoint}) async {
  dynamic response;
  final token = AppConfig.authToken ?? await sharedPrefs.getAuthToken();
  try {
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    Map<String, String> headers = <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    response = await http
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 30));
  } on Exception catch (error) {
    debugPrint(error.toString());
    if (error.toString().contains('SocketException')) {
      debugPrint("Error occurred while communicating with Server!");
    }
  }
  return response;
}

Future<http.Response> postRequestWithToken(
    {required String endPoint, Map<String, dynamic>? body}) async {
  final token = AppConfig.authToken ?? await sharedPrefs.getAuthToken();
  dynamic response;
  try {
    final url = Uri.parse(AppConfig.baseUrl + endPoint);
    Map<String, String> headers = <String, String>{
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    response = await http
        .post(url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 30));
  } on Exception catch (error) {
    debugPrint(error.toString());
    if (error.toString().contains('SocketException')) {
      debugPrint("Error occurred while communicating with Server!");
    }
  }
  return response;
}
