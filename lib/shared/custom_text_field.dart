import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final bool? centeredHint;
  final TextInputAction textInputAction;
  final Color? borderColor;
  final Color? hintColor;
  final TextCapitalization textCapitalization;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.suffix,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.hintStyle,
    this.textInputAction = TextInputAction.next,
    this.centeredHint = false,
    this.readOnly = false,
    this.obscureText = false,
    this.borderColor,
    this.hintColor,
    this.maxLines = 1,
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  String get _label => label ?? "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_label.isNotEmpty) ...{
          Text(
            _label,
            style: TextStyle(fontSize: 16.sp),
          ),
          const CustomSpacer(
            flex: 1,
          ),
        },
        SizedBox(
          height: 46.h,
          child: TextFormField(
            obscureText: obscureText,
            onTap: onTap,
            readOnly: readOnly,
            maxLines: maxLines,
            textCapitalization: textCapitalization,
            cursorColor: borderColor,
            style: TextStyle(
              fontSize: 14.sp,
              color: hintColor ?? Theme.of(context).primaryColorLight,
            ),
            textInputAction: textInputAction,
            autovalidateMode: AutovalidateMode.disabled,
            textAlign: centeredHint! ? TextAlign.center : TextAlign.start,
            keyboardType: keyboardType,
            controller: controller,
            focusNode: focusNode,
            validator: (value) {
              return validator?.call(value ?? "");
            },
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffix,
              prefixIcon: prefix,
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 14.sp, color: hintColor ?? Palette.lightGrey),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.lightGrey,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.lightGrey,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Palette.lightGrey,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(30.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}