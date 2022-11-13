import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormBox extends StatelessWidget {
  const TextFormBox({
    Key? key,
    required this.theme,
    this.labelText,
    this.prefixIcon,
    required this.validator,
    required this.onChanged,
    this.suffixIcon,
    this.suffixIconPressed,
    this.isOboarding = false,
    this.controller,
    this.horizontalContentPadding = 30,
    this.onTap,
    this.readOnly = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final ThemeData theme;
  final String? labelText;
  final String? prefixIcon;
  final Function validator;
  final Function onChanged;
  final String? suffixIcon;
  final Function()? suffixIconPressed;
  final bool isOboarding;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final double horizontalContentPadding;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: theme.textTheme.bodyText1,
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      autovalidateMode: autovalidateMode,
      cursorHeight: 25.h,
      onChanged: (value) => onChanged(value),
      validator: (value) => validator(value),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: horizontalContentPadding),
        suffixIcon: suffixIcon == null
            ? null
            : GestureDetector(
                onTap: () => suffixIconPressed,
                child: Image.asset(
                  suffixIcon!,
                ),
              ),
        labelText: labelText ?? 'Enter here',
        labelStyle: theme.textTheme.labelMedium,
        prefixIcon: prefixIcon == null ? null : Image.asset(prefixIcon!),
        fillColor: const Color(0xFFF8F8F8),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xff575C60),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xff6F5FF8),
            width: 0.6,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xff575C60),
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
