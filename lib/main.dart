import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/utils/theme.dart';
import 'core/utils/translate.dart';
import 'init_app.dart' as di;
import 'app/routes/app_pages.dart';

void main() async {
  await di.initApp();
  runApp(GetMaterialApp(
    translations: TranslateWeatherApp(),
    locale: Get.deviceLocale,
    fallbackLocale: Locale('en', 'US'),
    theme: kLightTheme,
    debugShowCheckedModeBanner: false,
    title: "WeatherApp",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
