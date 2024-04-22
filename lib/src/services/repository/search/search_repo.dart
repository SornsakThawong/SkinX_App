import 'package:dio/dio.dart';

abstract class SearchRepo {
  Future<Response> getSearch({required String token, required String query});
}
