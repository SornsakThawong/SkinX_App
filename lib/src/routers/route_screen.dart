import 'package:get/get.dart';
import 'package:skin_x_app/src/bindings/auth/auth_binding.dart';
import 'package:skin_x_app/src/feature/initial/screens/nav_bar_screen.dart';
import 'package:skin_x_app/src/feature/initial/screens/splash_screen.dart';
import 'package:skin_x_app/src/routers/route_path.dart';

class RouteScreen {
  static const initial = RoutePath.splash;

  static final routes = [
    GetPage(
      name: RoutePath.splash,
      page: () => SplashScreen(),
      binding: AuthRepoBindings(),
    ),
    GetPage(
      name: RoutePath.navBar,
      page: () => NavBarScreen(),
      binding: AuthRepoBindings(),
    ),
  ];
}