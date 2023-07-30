import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool loading;
  final Function onPressed;
  final bool outlined;
  final bool inDialog;
  final bool active;
  final bool hasIcon;
  final Size? size;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;

  const Button(
      {Key? key,
      required this.text,
      this.loading = false,
      required this.onPressed,
      this.outlined = false,
      this.inDialog = false,
      this.active = true,
      this.hasIcon = false,
      this.size,
      this.color,
      this.borderColor,
      this.textColor})
      : super(key: key);

  MaterialStateProperty<Size> get minSize => MaterialStateProperty.resolveWith(
        (states) =>
            size ??
            Size(
              300.w,
              40.h,
            ),
      );
  MaterialStateProperty<Size> get dialogMinSize =>
      MaterialStateProperty.resolveWith(
        (states) => Size(
          57.w,
          25.h,
        ),
      );

  @override
  Widget build(BuildContext context) {
    Widget child = loading
        ? SizedBox(
            height: 30.h,
            width: 30.h,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.aquayarWhite),
            ),
          )
        : Text(
            text,
            style: TextStyle(
                fontSize: inDialog ? 12.sp : 14.sp,
                fontWeight: FontWeight.w400,
                color: textColor ?? Palette.aquayarWhite),
          );
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        fixedSize: MaterialStateProperty.resolveWith((states) => size),
        minimumSize: inDialog ? dialogMinSize : minSize,
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => !active ? null : Palette.aquayarWhite.withOpacity(.75),
        ),
        backgroundColor: outlined
            ? null
            : MaterialStateProperty.resolveWith(
                (states) => color ?? (!active ? null : Palette.aquayarBlue),
              ),
        side: outlined
            ? MaterialStateProperty.resolveWith(
                (states) => BorderSide(
                  color: borderColor ?? Palette.lightGrey,
                ),
              )
            : null,
      ),
      child: hasIcon
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  child,
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Palette.aquayarWhite,
                    size: 22,
                  ),
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
      onPressed: () => active ? onPressed() : () {},
    );
  }
}