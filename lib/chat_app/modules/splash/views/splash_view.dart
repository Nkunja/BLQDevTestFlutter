import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/values/colors.dart';
import '../../../widgets/texts/inter.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return const Scaffold(
      backgroundColor: AppColors.chineseBlack,
      body: Center(
        child: Inter.semiBold(
          'TESTVALLEY',
          size: 40,
          color: AppColors.vividRaspberry,
        ),
      ),
    );
  }
}
