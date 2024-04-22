import 'package:get/get.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo_impl.dart';

class AuthRepoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepo>(
      () => AuthRepoImpl(),
      tag: (AuthRepo).toString(),
    );
  }
}
