import 'package:dio/dio.dart';
import 'package:skin_x_app/src/core/config/app_config.dart';
import 'package:skin_x_app/src/services/api/dio_service.dart';
import 'package:skin_x_app/src/services/repository/playlist/playlist_repo.dart';

class PlaylistRepoImpl extends DioService implements PlaylistRepo {
  @override
  Future<Response> getPlaylist(
      {required String token, required String playlistId}) async {
    var endpoint = "${AppConfig().baseUrl}/playlists/$playlistId";
    Options options = Options(
      headers: {"Authorization": token},
    );
    return await httpDio.get(endpoint, options: options);
  }
}
