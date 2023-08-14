
import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String path;

  const CustomIcon({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 22.h,
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Palette.lightGrey, width: 1.5)),
      child: SvgPicture.asset("assets/svgs/$path.svg"),
    );
  }
}
