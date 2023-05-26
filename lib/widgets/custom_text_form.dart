import 'package:flutter/material.dart';
import 'package:kooho_test/utils/colors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.label,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.errorText,
    this.obscure = false,
    this.hint,
    this.prefix,
    this.fillColor,
    this.borderColor,
    this.hintStyle,
  });
  final String? label;
  final String? hint;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? errorText;
  final TextEditingController? controller;
  final bool obscure;
  final Function(String)? validator;
  final Color? fillColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Text(
            label!,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.grey80,
                ),
          ),
        if (label != null) const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.whiteFF,
                fontWeight: FontWeight.w500,
              ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: validator,
          validator: (value) => validator!(value!),
          textInputAction: TextInputAction.done,
          obscureText: obscure,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: hint ?? "",
            hintStyle: hintStyle ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.grey80,
                    ),
            errorText: errorText,
            suffixIcon: suffixIcon,
            prefixIcon: prefix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? AppColors.amber02),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? AppColors.amber02),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: borderColor ?? AppColors.amber02),
            ),
            filled: true,
            fillColor: fillColor ?? AppColors.black14,
          ),
          cursorColor: borderColor ?? AppColors.amber02,
          cursorWidth: 4,
        ),
      ],
    );
  }
}
