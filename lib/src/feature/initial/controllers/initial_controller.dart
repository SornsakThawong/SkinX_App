import 'package:get/get.dart';
import 'package:skin_x_app/src/routers/route_path.dart';

class InitialController extends GetxController {
  init() async {
    await 1.delay();
    Get.offNamed(RoutePath.login);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
