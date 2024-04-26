import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/playlist/controllers/playlist_detail_controller.dart';

class PlaylistDetailScreen extends StatelessWidget {
  PlaylistDetailScreen({super.key});
  final _playlistCtrl = Get.put(PlaylistDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: 100,
            color: Colors.grey.withOpacity(0.3),
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 150,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
