import 'package:dio/dio.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';

abstract class DioService {
  // static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
      baseUrl: AppConfig().baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: "application/json");

  Dio get httpDio => Dio(_options);

  // Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
  //   try {
  //     Response<T> response = await api;
  //     log('+++++++++++++++++ : ${response}');

  //     if (response.statusCode != HttpStatus.ok ||
  //         (response.data as Map<String, dynamic>)['statusCode'] !=
  //             HttpStatus.ok) {}

  //     return response;
  //   }
  //   // catch (e) {
  //   //   throw e.toString();
  //   // }
  //   on DioException catch (dioError) {
  //     // log('=======> E : ${dioError.error}');
  //     // log('=======> M : ${dioError.message}');
  //     // log('=======> R : ${dioError.response}');
  //     // log('=======> T : ${dioError.type}');
  //     // throw dioError.error ?? "";

  //     Object exception = handleDioError(dioError);
  //     log(' ===================: 1');
  //     // logger.e(
  //     //     "Throwing error from repository: >>>>>>> $exception : ${(exception as AppException).message}");
  //     throw exception;
  //   } catch (error) {
  //     // logger.e("Generic error: >>>>>>> $error");
  //     log(' ===================: 2');
  //     if (error is BaseException) {
  //       log(' ===================: 3');
  //       rethrow;
  //     }
  //     log(' ===================: 4');
  //     throw handleError("$error");
  //   }
  // }
}
