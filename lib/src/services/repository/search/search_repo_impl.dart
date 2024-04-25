import 'package:dio/dio.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';
import 'package:skin_x_app/src/services/api/dio_service.dart';
import 'package:skin_x_app/src/services/repository/search/search_repo.dart';

class SearchRepoImpl extends DioService implements SearchRepo {
  @override
  Future<Response> getSearch(
      {required String token, required String query}) async {
    var endpoint = "${AppConfig().baseUrl}/search?q=$query&type=album";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    return await httpDio.get(endpoint, options: options);
  }
}
