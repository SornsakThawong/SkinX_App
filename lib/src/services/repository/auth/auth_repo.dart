import 'package:dio/dio.dart';

abstract class AuthRepo {
  Future<Response> login({required String code});
  Future<Response> getUser({required String token});
  Future<Response> refreshToken(
      {required String token,
      required String refreshToken,
      required String userId});
  Future<Response> getToken();
}
