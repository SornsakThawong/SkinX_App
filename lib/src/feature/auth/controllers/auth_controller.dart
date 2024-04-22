import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo.dart';

class AuthController extends GetxController {
  final _authProvider = Get.find<AuthProvider>();

  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());

  String get token => _authProvider.token;

  Future getToken() async {
    try {
      var res = await _repository.getToken();
      // log('message res access_token: ${res.data["access_token"]}');
      _authProvider.setToken(res.data["access_token"]);
    } catch (e) {
      // log('============== [ERROR] : ${(e as DioException).response!.statusCode}');
    }
  }
}
