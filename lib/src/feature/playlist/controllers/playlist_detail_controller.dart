import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/core/base/base_controller.dart';
import 'package:skin_x_app/src/core/widgets/bottom_search_widget.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';
import 'package:skin_x_app/src/feature/playlist/models/playlist_model.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo.dart';
import 'package:skin_x_app/src/services/repository/search/search_repo.dart';

class PlaylistDetailController extends BaseController {
  final _authProvider = Get.find<AuthProvider>();

  final PlaylistRepo _repository = Get.find(tag: (PlaylistRepo).toString());
  final SearchRepo _searchRepository = Get.find(tag: (SearchRepo).toString());

  String get accessToken => _authProvider.accessToken;

  final _playlist = PlaylistItemModel().obs;
  PlaylistItemModel get playlist => _playlist.value;

  onSearch() {
    if (Get.isBottomSheetOpen ?? false) return;
    Searching.instance.show((String value) async {
      logInfo("onSearch : $value");
      if (value == "") return;
      await getSearch(value);
    });
  }

  Future playlistDetail(String playlistId) async {
    try {
      var res = await _repository.getPlaylist(
          token: accessToken, playlistId: playlistId);
      logInfo(" ==> ${jsonEncode(res.data)}");
      _playlist.value = PlaylistItemModel.fromJson(res.data);
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  Future addItemToPlaylist(String playlistName) async {
    try {
      var res = await _repository.addItemToPlaylist(
          token: accessToken, playlistId: "-", uris: "-");
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  Future removePlaylist(String playlistName) async {
    try {
      var res = await _repository.removeItemInPlaylist(
          token: accessToken, playlistId: "-", snapshotId: "-", uri: "-");
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  Future getSearch(String query, {String? type}) async {
    try {
      var res =
          await _searchRepository.getSearch(token: accessToken, query: query);
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  init() async {
    await playlistDetail(Get.arguments);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
