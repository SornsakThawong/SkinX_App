import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _authCtrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _authCtrl.code == ""
          ? WebViewWidget(
              controller: _authCtrl.webviewCtrl,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
