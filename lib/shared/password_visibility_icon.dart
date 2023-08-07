import 'package:aquayar_driver/shared/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordVisibilityIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final bool value;

  const PasswordVisibilityIcon({
    Key? key,
    required this.onPressed,
    this.value = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: Palette.aquayarBlack,
        size: 20.w,
      ),
    );
  }
}
