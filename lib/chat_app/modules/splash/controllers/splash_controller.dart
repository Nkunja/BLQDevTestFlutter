import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(seconds: 1), () {
      Get.offAndToNamed(Paths.chatScreen);
    });
  }
}
