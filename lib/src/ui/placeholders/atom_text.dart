import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const AtomText._(this.text, {this.textStyle, Key? key}) : super(key: key);

  // Title Versions
  AtomText.titleLarge(String text, {Key? key})
      : this._(text,
            textStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            key: key);

  AtomText.title(String text, {Key? key})
      : this._(text,
            textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            key: key);

  AtomText.titleSmall(String text, {Key? key})
      : this._(text,
            textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            key: key);

  // Body Versions
  AtomText.bodyLarge(String text, {Key? key})
      : this._(text, textStyle: TextStyle(fontSize: 18.sp), key: key);

  AtomText.body(String text, {Key? key})
      : this._(text, textStyle: TextStyle(fontSize: 16.sp), key: key);

  AtomText.bodySmall(String text, {Key? key})
      : this._(text, textStyle: TextStyle(fontSize: 14.sp), key: key);

  // Custom Style
  const AtomText.custom(String text, {TextStyle? textStyle, Key? key})
      : this._(text, textStyle: textStyle, key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
