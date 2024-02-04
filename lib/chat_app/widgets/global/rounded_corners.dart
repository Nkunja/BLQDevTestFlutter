import 'package:flutter/material.dart';

class RoundedCorners extends StatelessWidget {
  final double radius;
  final Widget child;
  final bool onlyOnTop;

  const RoundedCorners({
    super.key,
    this.radius = 10,
    this.onlyOnTop = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: onlyOnTop
          ? BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            )
          : BorderRadius.circular(radius),
      child: child,
    );
  }
}
