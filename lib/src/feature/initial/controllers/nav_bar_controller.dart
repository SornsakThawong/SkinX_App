import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/core/base/base_controller.dart';
import 'package:skin_x_app/src/feature/auth/controllers/auth_provider.dart';
import 'package:skin_x_app/src/feature/playlist/screens/playlist_screen.dart';
import 'package:skin_x_app/src/feature/profile/screens/profile_screen.dart';
import 'package:skin_x_app/src/services/repository/auth/auth_repo.dart';

class NavBarController extends BaseController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  onSelectIndex(int index) {
    _selectedIndex(index);
  }

  final List<Widget> screens = [
    PlaylistScreen(),
    ProfileScreen(),
  ];

  final _authProvider = Get.find<AuthProvider>();
  final AuthRepo _repository = Get.find(tag: (AuthRepo).toString());
  Future onRefreshToken() async {
    try {
      var res = await _repository.refreshToken(
          token: _authProvider.accessToken,
          refreshToken: _authProvider.refreshToken,
          userId: _authProvider.userId);

      logInfo("message RefreshToken ==> ${res.data}");
    } catch (e) {
      logError("${(e as DioException).response!.statusCode}");
      logError("${(e as DioException).response!.data}");
      logError("${(e as DioException).response!.statusMessage}");
    }
  }
}
