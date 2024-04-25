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
    return await httpDio.post(endpoint, data: data, options: options);
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
