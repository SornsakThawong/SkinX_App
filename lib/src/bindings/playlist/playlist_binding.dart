import 'package:get/get.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo_impl.dart';

class PlaylistRepoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaylistRepo>(
      () => PlaylistRepoImpl(),
      tag: (PlaylistRepo).toString(),
    );
  }
}
