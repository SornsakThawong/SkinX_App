import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:skin_x_app/src/routers/route_path.dart';

class InitialController extends GetxController {
  final _authCtrl = Get.put(AuthController());

  init() async {
    await 1.delay();
    await _authCtrl.getToken();
    Get.offNamed(RoutePath.navBar);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
