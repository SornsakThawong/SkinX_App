import 'package:dio/dio.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';
import 'package:skin_x_app/src/services/api/dio_service.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo.dart';

class PlaylistRepoImpl extends DioService implements PlaylistRepo {
  @override
  Future<Response> createPlaylist({
    required String token,
    required String userId,
    required String playlistName,
    String description = "",
  }) async {
    var endpoint = "${AppConfig().baseUrl}/users/$userId/playlists";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    var data = {
      "name": playlistName,
      "description": description,
      "public": false
    };
    return await httpDio.post(endpoint, data: data, options: options);
  }

  @override
  Future<Response> addItemToPlaylist({
    required String token,
    required String playlistId,
    required String uris,
    String description = "",
  }) async {
    var endpoint = "${AppConfig().baseUrl}/playlists/$playlistId/tracks";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    var data = {
      "uris": [uris],
      "position": 0
    };
    return await httpDio.post(endpoint, data: data, options: options);
  }

  @override
  Future<Response> removeItemInPlaylist({
    required String token,
    required String playlistId,
    required String uri,
    required String snapshotId,
  }) async {
    var endpoint = "${AppConfig().baseUrl}/playlists/$playlistId/tracks";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    var data = {
      "tracks": [
        {"uri": uri}
      ],
      "snapshot_id": snapshotId
    };
    return await httpDio.delete(endpoint, data: data, options: options);
  }

  @override
  Future<Response> getPlaylistMe(
      {required String token, required String userId}) async {
    var endpoint = "${AppConfig().baseUrl}/users/$userId/playlists";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    return await httpDio.get(endpoint, options: options);
  }

  @override
  Future<Response> getPlaylist(
      {required String token, required String playlistId}) async {
    var endpoint = "${AppConfig().baseUrl}/playlists/$playlistId";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    return await httpDio.get(endpoint, options: options);
  }

  @override
  Future<Response> getSearch(
      {required String token, required String query}) async {
    var endpoint = "${AppConfig().baseUrl}/search?q=$query&type=album";
    Options options = Options(
      headers: {"Authorization": "Bearer $token"},
    );
    return await httpDio.get(endpoint, options: options);
  }
}
