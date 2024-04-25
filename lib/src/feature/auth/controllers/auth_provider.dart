import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/auth/models/auth_model.dart';
import 'package:skin_x_app/src/feature/auth/models/user_model.dart';

class AuthProvider extends GetxController {
  Future<AuthProvider> init() async => this;

  final _authData = AuthModel().obs;
  AuthModel get authData => _authData.value;

  final _user = UserModel().obs;
  UserModel get user => _user.value;

  String get accessToken => authData.accessToken ?? "";
  String get userId => user.id ?? "";

  setAuthModel(AuthModel value) {
    _authData(value);
  }

  setUser(UserModel value) {
    _user(value);
  }
}
