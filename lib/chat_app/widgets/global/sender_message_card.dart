import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../texts/inter.dart';
import 'rounded_corners.dart';
import '../../utils/values/colors.dart';

class SenderMessageCard extends StatelessWidget {
  final String user;
  final bool online;
  final String image;
  final String message;
  final String timeago;

  const SenderMessageCard({
    super.key,
    required this.image,
    required this.user,
    required this.message,
    required this.online,
    required this.timeago,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image.isNotEmpty) ...[
          Container(
            alignment: Alignment.topLeft,
            child: RoundedCorners(
              radius: 100,
              child: CachedNetworkImage(
                imageUrl: image,
                width: 32,
                height: 32,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ] else ...[
          RoundedCorners(
            radius: 100,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.palatinateBlue,
                ),
              ),
              child: const Center(child: Text(' 👻')),
            ),
          ),
        ],
        const SizedBox(width: 10),
        IntrinsicWidth(
          child: Container(
            constraints: BoxConstraints(maxWidth: Get.width * 0.7),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            decoration: const BoxDecoration(
              color: AppColors.darkCharcoal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Inter(
                      user,
                      color: AppColors.silverChalice,
                      size: 14,
                    ),
                    if (online) ...[
                      const SizedBox(width: 7),
                      RoundedCorners(
                        child: Container(
                          width: 6,
                          height: 6,
                          color: AppColors.turquoise,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Inter(
                  message,
                  size: 16,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        Inter(
          timeago,
          color: const Color(0xFF9C9CA3),
          size: 12,
        ),
      ],
    );
  }
}
