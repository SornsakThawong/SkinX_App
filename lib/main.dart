import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/app.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => AuthProvider().init());
  runApp(const App());
}
