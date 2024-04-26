import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  logInfo(String? message) {
    log(" ============ [INFO] : $message");
  }

  logError(String? message) {
    log(" ============ [ERROR] : $message");
  }

  // dynamic callDataService<T>(
  //   Future<T> future,
  //   //   {
  //   //   Function(Exception exception)? onError,
  //   //   Function(T response)? onSuccess,
  //   //   Function? onStart,
  //   //   Function? onComplete,
  //   // }
  // ) async {
  //   try {
  //     final T response = await future;
  //     return response;
  //   } catch (e) {
  //     DioException dioException = e as DioException;
  //     if (dioException.response?.statusCode == 401 &&
  //         dioException.response?.data["message"] ==
  //             "The access token expired") {

  //             }

  //     rethrow;
  //   }
  // }
}
