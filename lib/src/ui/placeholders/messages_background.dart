import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesBackground extends StatelessWidget {
  const MessagesBackground({
    super.key,
    required this.child,
    required this.color,
  });

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          radius: 60.sp,
          child: child,
        ),
        Positioned(
          left: -5,
          top: -10,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 30.sp,
          ),
        ),
        Positioned(
          left: -40,
          top: 30,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 34.sp,
          ),
        ),
        Positioned(
          right: -20,
          bottom: 35,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 5.sp,
          ),
        ),
        Positioned(
          right: -20,
          bottom: -5,
          child: CircleAvatar(
            backgroundColor: color,
            radius: 15.sp,
          ),
        ),
      ],
    );
  }
}
