import 'package:flutter/material.dart';

import '../texts/inter.dart';
import '../../utils/values/colors.dart';

class UserMessageCard extends StatelessWidget {
  final String message;

  const UserMessageCard({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 70),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(4),
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(16),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFF006B),
                Color(0xFFFF4593),
              ],
              stops: [0.1097, 0.7357],
              transform: GradientRotation(131.74),
            ),
          ),
          child: Inter(
            message,
            size: 14,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
