import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/playlist/screens/playlist_screen.dart';
import 'package:skin_x_app/src/feature/search/screens/search_screen.dart';

class NavBarController extends GetxController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  onSelectIndex(int index) {
    _selectedIndex(index);
  }

  final List<Widget> screens = [
    PlaylistScreen(),
    SearchScreen(),
  ];
}
