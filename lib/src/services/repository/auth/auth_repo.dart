import 'package:dio/dio.dart';

abstract class AuthRepo {
  Future<Response> login({required String code});
  Future<Response> getUser({required String token});
  Future<Response> getToken();
}
