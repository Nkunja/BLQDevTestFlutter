import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/texts/inter.dart';
import '../../../utils/values/colors.dart';
import '../controllers/chat_controller.dart';
import '../../../widgets/custom/valley_app_bar.dart';
import '../../../widgets/global/user_message_card.dart';
import '../../../widgets/global/sender_message_card.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());

    return GestureDetector(
      onTap: () => controller.hideKeyboard(),
      child: Scaffold(
        backgroundColor: AppColors.chineseBlack,
        appBar: ValleyAppBar(
          back: true,
          title: Inter.semiBold(
            'chat.sangnam_spot'.tr,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                'assets/icons/three-lines-icon.svg',
                width: 17,
                height: 17,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            Expanded(
              child: GetBuilder<ChatController>(builder: (logic) {
                return logic.loading.isTrue
                    ? const SpinKitDoubleBounce(
                        size: 50.0,
                        color: AppColors.vividRaspberry,
                      )
                    : ListView.builder(
                        controller: controller.scrollController,
                        itemCount: logic.allMessages.length,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          if (logic.allMessages[index].sender!.userId !=
                              controller.userId) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SenderMessageCard(
                                    image: logic
                                        .allMessages[index].sender!.profileUrl!,
                                    online: logic
                                        .allMessages[index].sender!.isActive!,
                                    user: logic
                                        .allMessages[index].sender!.nickname,
                                    message: logic.allMessages[index].message,
                                    timeago: timeago.format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                        logic.allMessages[index].createdAt,
                                      ),
                                      locale: 'en_short',
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  UserMessageCard(
                                    message: logic.allMessages[index].message,
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      );
              }),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                top: 15,
                right: 10,
                bottom: 30,
              ),
              color: const Color(0xFF131313),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: AppColors.white.withOpacity(0.2),
                        onTap: () {},
                        customBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/add-icon.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Obx(() {
                        return TextField(
                          controller: controller.messageTextController,
                          cursorColor: AppColors.white,
                          textInputAction: TextInputAction.send,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.darkCharcoal,
                            hintText: 'chat.send_message'.tr,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => controller.sendMessage(),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: controller.showSendButton.isTrue
                                      ? AppColors.vividRaspberry
                                      : AppColors.blackOlive,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/send-icon.svg',
                                ),
                              ),
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.blackOlive,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                width: 1,
                                color: AppColors.blackOlive,
                              ),
                            ),
                            hintStyle: GoogleFonts.inter(
                              fontSize: 16.sp,
                              color: AppColors.blackOlive,
                            ),
                          ),
                          onTap: () => controller.scrollListview(),
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            textBaseline: TextBaseline.alphabetic,
                          ),
                          onSubmitted: (value) => controller.sendMessage(),
                          onChanged: (value) =>
                              controller.onChangeMessage(value),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
