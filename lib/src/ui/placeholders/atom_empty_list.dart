import 'package:atom_kit/src/ui/placeholders/messages_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AtomEmptyList extends StatelessWidget {
  const AtomEmptyList({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MessagesBackground(
          color: Colors.grey.withOpacity(0.1),
          child: Icon(
            Icons.list_rounded,
            size: 70.sp,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'No data found'.tr,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        ElevatedButton(
          onPressed: onRetry,
          child: Text(
            'Retry'.tr,
          ),
        )
      ],
    );
  }
}
