import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_page_controller.dart';

class SplashPageView extends GetView<SplashPageController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: Center(
          child: Image(
              width: 300,
              height: 300,
              image: AssetImage(
                'assets/images/sun.png',
              ))),
    );
  }
}
