import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';

class ChipSelector extends StatelessWidget {
  const ChipSelector({
    super.key,
    required this.text,
    required this.ontap,
    this.bgColor,
    this.border,
    this.veriticalPadding,
    this.style,
    this.horizontalPadding,
  });
  final String text;
  final Function() ontap;
  final Color? bgColor;
  final Border? border;
  final double? veriticalPadding;
  final double? horizontalPadding;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: border ??
                Border.all(
                  color: AppColors.grey4D,
                ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 20,
            vertical: veriticalPadding ?? 3,
          ),
          child: Center(
            child: Text(
              text,
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.whiteFF),
            ),
          ),
        ),
      ),
    );
  }
}
