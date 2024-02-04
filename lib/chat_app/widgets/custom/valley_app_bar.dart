import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/values/colors.dart';

class ValleyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool back;
  final Widget title;
  final List<Widget>? actions;

  const ValleyAppBar({
    super.key,
    required this.title,
    this.actions,
    this.back = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
      backgroundColor: AppColors.chineseBlack,
      leading: back
          ? IconButton(
              onPressed: () {
                HapticFeedback.selectionClick();
                Get.back();
              },
              icon: SvgPicture.asset(
                'assets/icons/back-icon.svg',
                width: 18,
                height: 18,
              ),
            )
          : const SizedBox(),
      title: title,
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(210),
        ),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: AppColors.chineseBlack,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
