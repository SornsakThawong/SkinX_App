import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/playlist/controllers/playlist_controller.dart';
import 'package:skin_x_app/src/feature/playlist/models/search_albums_model.dart';

class AlbumsWidget extends StatelessWidget {
  AlbumsWidget({super.key});
  final _playlistCtrl = Get.find<PlaylistController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _playlistCtrl.searchAlbums.albums == null ||
              _playlistCtrl.searchAlbums.albums!.items!.isEmpty
          ? const SizedBox()
          : Expanded(
              child: ListView.separated(
                itemCount: _playlistCtrl.searchAlbums.albums!.items!.length,
                itemBuilder: (context, index) {
                  Item item = _playlistCtrl.searchAlbums.albums!.items![index];
                  return GestureDetector(
                    onTap: () {
                      Get.back();
                      _playlistCtrl.onDetail(item.id!);
                    },
                    child: SizedBox(
                      height: 80,
                      // color: Colors.red,
                      child: Row(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              color: Colors.grey.shade300,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name ?? "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      height: 1.2),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  item.name ?? "",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 30,
                ),
              ),
            ),
    );
  }
}
