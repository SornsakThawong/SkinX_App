import 'package:dio/dio.dart';

abstract class PlaylistRepo {
  Future<Response> getPlaylist(
      {required String token, required String playlistId});
}
