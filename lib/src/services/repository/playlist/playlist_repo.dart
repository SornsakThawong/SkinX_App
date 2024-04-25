import 'package:dio/dio.dart';

abstract class PlaylistRepo {
  Future<Response> createPlaylist({
    required String token,
    required String userId,
    required String playlistName,
    String description = "",
  });
  Future<Response> addItemToPlaylist({
    required String token,
    required String playlistId,
    required String uris,
    String description = "",
  });
  Future<Response> removeItemInPlaylist({
    required String token,
    required String playlistId,
    required String uri,
    required String snapshotId,
  });
  Future<Response> getPlaylistMe(
      {required String token, required String userId});
  Future<Response> getPlaylist(
      {required String token, required String playlistId});
      Future<Response> getSearch({required String token, required String query});
}
