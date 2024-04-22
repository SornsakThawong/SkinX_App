import 'package:get/get.dart';

class AuthProvider extends GetxController {
  Future<AuthProvider> init() async => this;

  final _token = "".obs;
  String get token => _token.value;

  setToken(String token) {
    _token(token);
  }
}
