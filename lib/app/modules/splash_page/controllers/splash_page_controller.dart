import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_pages.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    print('SplashPageController');
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {}
}
