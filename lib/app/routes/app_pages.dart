import 'package:get/get.dart';

import 'package:weather_app/app/modules/home/bindings/home_binding.dart';
import 'package:weather_app/app/modules/home/views/home_view.dart';
import 'package:weather_app/app/modules/splash_page/bindings/splash_page_binding.dart';
import 'package:weather_app/app/modules/splash_page/views/splash_page_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => SplashPageView(),
      binding: SplashPageBinding(),
    ),
  ];
}
