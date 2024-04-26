import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skin_x_app/src/feature/initial/controllers/nav_bar_controller.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({super.key});
  final navBarCtrl = Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => navBarCtrl.onRefreshToken(),
        // ),
        body: SafeArea(
          child: Center(
            child: navBarCtrl.screens.elementAt(navBarCtrl.selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade900,
          currentIndex: navBarCtrl.selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: navBarCtrl.onSelectIndex,
        ),
      ),
    );
  }
}
