import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/playlist/controllers/playlist_controller.dart';
import 'package:skin_x_app/src/feature/playlist/models/playlist_model.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});
  final _playlistCtrl = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: const Text("Mixed for you"),
          actions: [
            IconButton(
              onPressed: () => _playlistCtrl.onSearchAlbum(),
              icon: const Icon(
                Icons.search,
                size: 36,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () => _playlistCtrl.onCreatePlaylist(),
              icon: const Icon(
                Icons.add,
                size: 36,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Obx(
          () => _playlistCtrl.playlists.items == null ||
                  _playlistCtrl.playlists.items!.isEmpty
              ? const SizedBox()
              : GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: _playlistCtrl.playlists.items?.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (context, index) {
                    PlaylistItemModel item =
                        _playlistCtrl.playlists.items![index];
                    return GestureDetector(
                      onTap: () => _playlistCtrl.onDetail(item.id!),
                      // color: Colors.red.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.image,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            item.name ?? "",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            item.description == null || item.description == ""
                                ? "Playlist description."
                                : item.description!,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16, height: 1),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
