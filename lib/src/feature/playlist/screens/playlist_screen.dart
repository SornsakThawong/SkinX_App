import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/playlist/controllers/playlist_controller.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});
  final _playlistCtrl = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.red,
          title: const Text("Mixed for you"),
          ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _playlistCtrl.playlistMe(),
      // ),
      
      // body: GridView.builder(
      //   padding: const EdgeInsets.symmetric(horizontal: 15),
      //   itemCount: 10,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     mainAxisExtent: 250,
      //   ),
      //   itemBuilder: (context, index) => Container(
      //     color: Colors.red.shade200,
      //   ),
      // ),
    );
  }
}
