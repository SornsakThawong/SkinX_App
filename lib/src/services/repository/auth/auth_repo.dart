import 'package:dio/dio.dart';

abstract class AuthRepo {
  Future<Response> getToken();
  // Future<Response> testFN();
}
