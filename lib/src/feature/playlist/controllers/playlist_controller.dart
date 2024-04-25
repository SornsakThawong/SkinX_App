import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo.dart';

class PlaylistController extends GetxController {
  final _authProvider = Get.find<AuthProvider>();

  final PlaylistRepo _repository = Get.find(tag: (PlaylistRepo).toString());

  String get accessToken => _authProvider.accessToken;

  Future playlistMe() async {
    try {
      var res = await _repository.getPlaylistMe(
          token: accessToken, userId: _authProvider.userId);
    } catch (e) {
      log('============== [ERROR] playlistMe : ${(e as DioException).response!.statusCode}');
    }
  }

  @override
  void onInit() {
    playlistMe();
    super.onInit();
  }
}
