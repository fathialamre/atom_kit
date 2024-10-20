import 'package:atom_kit/src/ui/placeholders/messages_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AtomErrorList extends StatelessWidget {
  const AtomErrorList({super.key, this.onRetry, this.message});

  final VoidCallback? onRetry;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MessagesBackground(
          color: Colors.redAccent.withOpacity(0.1),
          child: Icon(
            Icons.warning_amber,
            size: 50.sp,
            color: Colors.redAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            textAlign: TextAlign.center,
            message ?? 'No data found'.tr,
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
