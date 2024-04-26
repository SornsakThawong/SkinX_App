import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/core/base/base_controller.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';
import 'package:skin_x_app/src/feature/auth/models/auth_model.dart';
import 'package:skin_x_app/src/feature/auth/models/user_model.dart';
import 'package:skin_x_app/src/routers/route_path.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthController extends BaseController {
  final _authProvider = Get.find<AuthProvider>();

  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());

  late WebViewController webviewCtrl;

  Future login(String code) async {
    try {
      var res = await _repository.login(code: code);
      // logInfo(" =========: ${res.data}");
      AuthModel data = AuthModel.fromJson(res.data);
      _authProvider.setAuthModel(data);
      if (_authProvider.accessToken != "") {
        await getUserMe(_authProvider.accessToken).then((value) {
          if (value) {
            Get.offNamed(RoutePath.navBar);
          }
        });
      }
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  Future<bool> getUserMe(String token) async {
    try {
      var res = await _repository.getUser(token: token);
      // logInfo("User Data: ${res.data}");
      UserModel user = UserModel.fromJson(res.data);
      _authProvider.setUser(user);
      return true;
    } catch (e) {
      // log('============== [ERROR] a : ${(e as DioException).response!.data}');
      return false;
    }
  }

  final _code = "".obs;
  String get code => _code.value;

  WebViewController webViewController() {
    String scope =
        "user-read-private user-read-email playlist-read-private playlist-modify-private";
    // String scope = "user-read-private user-read-email";

    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) async {
            _code.value = url.split("code=")[1];
            await login(code);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            // if (request.url.startsWith(checkUrl)) {
            //   return NavigationDecision.prevent;
            // }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          '${AppConfig().baseAccountUrl}/authorize?response_type=code&client_id=${AppConfig().clientId}&scope=$scope&redirect_uri=${AppConfig().redirectUrl}',
        ),
      );
  }

  @override
  void onInit() {
    webviewCtrl = webViewController();
    super.onInit();
  }
}
