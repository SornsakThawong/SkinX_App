import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: const Text("Mixed for you"),
      ),
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
