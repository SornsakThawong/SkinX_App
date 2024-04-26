import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_x_app/src/core/base/base_controller.dart';
import 'package:skin_x_app/src/feature/auth/models/auth_model.dart';
import 'package:skin_x_app/src/feature/auth/models/user_model.dart';
import 'package:skin_x_app/src/services/prefs/prefs_service.dart';

class AuthProvider extends BaseController {
  Future<AuthProvider> init() async {
    // _prefs = await SharedPreferences.getInstance();
    // await PreferenceManager.getString("key");
    return this;
  }

  // late SharedPreferences _prefs;
  // SharedPreferences get prefs => _prefs;

  final _authData = AuthModel().obs;
  AuthModel get authData => _authData.value;

  final _user = UserModel().obs;
  UserModel get user => _user.value;

  String get accessToken => authData.accessToken ?? "";
  String get refreshToken => authData.refreshToken ?? "";
  String get userId => user.id ?? "";

  setAuthModel(AuthModel value) {
    _authData(value);
  }

  setUser(UserModel value) {
    _user(value);
  }
}
