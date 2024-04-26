import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/core/base/base_controller.dart';
import 'package:skin_x_app/src/core/widgets/bottom_search_widget.dart';
import 'package:skin_x_app/src/core/widgets/bottom_widget.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';
import 'package:skin_x_app/src/feature/playlist/models/playlist_model.dart';
import 'package:skin_x_app/src/feature/playlist/models/search_albums_model.dart';
import 'package:skin_x_app/src/feature/playlist/widgets/albums_widget.dart';
import 'package:skin_x_app/src/feature/playlist/widgets/create_playlist_widget.dart';
import 'package:skin_x_app/src/routers/route_path.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo.dart';
import 'package:skin_x_app/src/services/repository/search/search_repo.dart';

class PlaylistController extends BaseController {
  final _authProvider = Get.find<AuthProvider>();

  final PlaylistRepo _repository = Get.find(tag: (PlaylistRepo).toString());
  final SearchRepo _searchRepository = Get.find(tag: (SearchRepo).toString());

  String get accessToken => _authProvider.accessToken;

  final _playlists = PlaylistModel().obs;
  PlaylistModel get playlists => _playlists.value;

  final _searchAlbums = SearchAlbumsModel().obs;
  SearchAlbumsModel get searchAlbums => _searchAlbums.value;

  onCreatePlaylist() {
    BottomWidget.instance.show(
      CreatePlaylistWidget(
        onPressed: (value) async {
          logInfo("message : $value");
          Get.back();
          await createPlaylist(value).then((value) async => await playlistMe());
        },
      ),
    );
  }

  onDetail(String playlistId) async {
    Get.toNamed(RoutePath.detail, arguments: playlistId);
    // await playlistDetail(playlistId);
  }

  onSearchAlbum() {
    if (Get.isBottomSheetOpen ?? false) return;
    _searchAlbums(SearchAlbumsModel());
    Searching.instance.show((
      String value,
    ) async {
      logInfo("onSearchAlbum : $value");
      if (value == "") {
        _searchAlbums(SearchAlbumsModel());
        return;
      }
      await getSearch(value, type: "album");
    }, child: AlbumsWidget());
  }

  Future playlistMe() async {
    try {
      var res = await _repository.getPlaylistMe(
          token: accessToken, userId: _authProvider.userId);
      // logInfo("playlistMe statusCode: ${res.statusCode}");
      // logInfo("playlistMe data: ${res.data}");
      _playlists.value = PlaylistModel.fromJson(res.data);
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  Future createPlaylist(String playlistName) async {
    try {
      var res = await _repository.createPlaylist(
        token: accessToken,
        userId: _authProvider.userId,
        playlistName: playlistName,
      );
    } catch (e) {
      // logError("e_4 : ${(e as DioException).response!.}");
    }
  }

  Future getSearch(String query, {String? type}) async {
    try {
      var res = await _searchRepository.getSearch(
          token: accessToken, query: query, type: type);
      // logInfo(" ==> ${jsonEncode(res.data)}");
      _searchAlbums.value = SearchAlbumsModel.fromJson(res.data);
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
    }
  }

  @override
  void onInit() {
    playlistMe();
    super.onInit();
  }
}
