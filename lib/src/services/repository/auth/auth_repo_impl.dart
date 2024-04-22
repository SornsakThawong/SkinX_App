import 'package:dio/dio.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';
import 'package:skin_x_app/src/services/api/dio_service.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo.dart';

class AuthRepoImpl extends DioService implements AuthRepo {
  @override
  Future<Response> getToken() async {
    var endpoint = AppConfig().baseAccountUrl;
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

  // Dio _dio = Dio();
  // final String _t =
  //     "Bearer BQCeX1mP7J9SgERbISBBavPAPOclr2IDPGyv-DRD-bIr1w5zzfVc23dpOQMqaftOGmhABwOdFw8a-kg6GXVG171lrQxrjIyYaSorSGMcKTfetAwHPzY";
  // @override
  // Future<Response> testFN() async {
  //   // var endpoint = "https://pokeapi.co/api/v2/pokemon/ditto";
  //   var endpoint =
  //       "https://api.spotify.com/v1/playlists/37i9dQZF1DXc51TI5dx7RC";
  //   // var endpoint = AppConfig().baseAccountUrl;
  //   Options options = Options(
  //     headers: {"Authorization": _t},
  //     // contentType: Headers.jsonContentType,
  //   );
  //   // Options options = Options(
  //   //   contentType: Headers.jsonContentType, // Adjust content type as necessary
  //   // );
  //   var dioCall = _dio.get(
  //     endpoint,
  //     options: options,
  //   );
  //   // var dioCall = _dio.get(endpoint, options: options);
  //   try {
  //     return await dioCall;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  // @override
  // Future getToken() async {
  //   var endpoint = AppConfig().baseAccountUrl;
  //   var dioCall = httpDio.post(
  //     endpoint,
  //     // options: Options(headers: {'Authorization': 'Bearer $myToken'})
  //   );
  //   try {
  //     Response res = await callApiWithErrorParser(dioCall);
  //     // res.statusCode
  //     // return callApiWithErrorParser(dioCall)
  //     //     .then((response) => _parseResponse(response));
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Response _parseResponse(Response response) {
  //   return response;
  // }
}
