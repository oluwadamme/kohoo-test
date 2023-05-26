import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.onTap,
    this.size,
    this.bgColor,
    required this.text,
    this.style,
    this.radius,
  });
  final Function() onTap;
  final Size? size;
  final Color? bgColor;
  final String text;
  final TextStyle? style;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.black33,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        fixedSize: size ?? const Size(130, 40),
        alignment: Alignment.center,
      ),
      child: Text(
        text,
        style: style ??
            TextStyle(
              fontSize: 14,
              color: AppColors.amber0D,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
