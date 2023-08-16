import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlagPrefixIcon extends StatelessWidget {
  const FlagPrefixIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      margin: EdgeInsets.only(right: 10.w),
      child: Row(
        children: [
          const Spacer(),
          SvgPicture.asset(
            "assets/svgs/flag.svg",
            height: 15.h,
            width: 20.w,
            fit: BoxFit.scaleDown,
          ),
          const Spacer(),
          Container(
            height: 35.h,
            width: 1,
            color: Palette.lightGrey,
          ),
        ],
      ),
    );
  }
}
