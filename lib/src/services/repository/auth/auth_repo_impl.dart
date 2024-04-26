import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';
import 'package:skin_x_app/src/services/api/dio_service.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo.dart';

class AuthRepoImpl extends DioService implements AuthRepo {
  @override
  Future<Response> login({required String code}) async {
    var endpoint = "${AppConfig().baseAccountUrl}/api/token";
    Options options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );
    var data = {
      'code': code,
      'grant_type': 'authorization_code',
      'redirect_uri': AppConfig().redirectUrl,
      'client_id': AppConfig().clientId,
      'client_secret': AppConfig().clientSecret,
    };
    var dioCall = httpDio.post(endpoint, data: data, options: options);
    return await dioCall;
    // return await callApi(dioCall);
  }

  @override
  Future<Response> getUser({required String token}) async {
    var endpoint = "${AppConfig().baseUrl}/me";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    return await httpDio.get(endpoint, options: options);
  }

  @override
  Future<Response> refreshToken(
      {required String token,
      required String refreshToken,
      required String userId}) async {
    var endpoint = "${AppConfig().baseAccountUrl}/api/token";
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${AppConfig().clientId}:${AppConfig().clientSecret}'))}';
    Options options = Options(
      contentType: Headers.formUrlEncodedContentType,
      headers: {"Authorization": basicAuth},
    );
    var data = {
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      "scope":
          "user-read-private user-read-email playlist-read-private playlist-modify-private"
    };

    // log("message Url : $endpoint");
    // log("message Refresh Token : $refreshToken");
    // log("message Data : $data");

    var dioCall = httpDio.post(endpoint, data: data, options: options);
    return await dioCall;
    // return await callApi(dioCall);
  }

  @override
  Future<Response> getToken() async {
    var endpoint = "${AppConfig().baseAccountUrl}/api/token";
    Options options = Options(
      // headers: {"Authorization": _t},
      contentType: Headers.formUrlEncodedContentType,
    );
    var data = {
      'grant_type': 'client_credentials',
      'client_id': AppConfig().clientId,
      'client_secret': AppConfig().clientSecret,
    };
    return await httpDio.post(endpoint, data: data, options: options);
  }
}
