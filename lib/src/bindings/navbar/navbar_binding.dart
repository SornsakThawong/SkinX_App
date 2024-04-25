import 'package:get/get.dart';
import 'package:skin_x_app/src/bindings/auth/auth_binding.dart';
import 'package:skin_x_app/src/bindings/playlist/playlist_binding.dart';
import 'package:skin_x_app/src/bindings/search/search_binding.dart';

class NavbarBinding implements Bindings {
  @override
  void dependencies() {
    AuthRepoBindings().dependencies();
    PlaylistRepoBindings().dependencies();
    SearchRepoBindings().dependencies();
  }
}
