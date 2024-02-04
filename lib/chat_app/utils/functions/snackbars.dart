import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';

getBottomSheet({
  required Widget child,
  bool isDismissible = true,
  bool hideBackground = false,
  RoundedRectangleBorder? shape,
  bool isScrollControlled = false,
  Color backgroundColor = AppColors.chineseBlack,
}) {
  Get.bottomSheet(
    Scrollbar(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: child,
      ),
    ),
    elevation: 0,
    shape: shape,
    isDismissible: isDismissible,
    backgroundColor: backgroundColor,
    isScrollControlled: isScrollControlled,
    barrierColor: hideBackground ? null : Colors.transparent,
  );
}
