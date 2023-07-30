import 'dart:ui';

import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransparentAquayarIcon extends StatelessWidget {
  const TransparentAquayarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const CustomSpacer(
        flex: 8,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 70.w,
            width: 70.w,
            decoration: BoxDecoration(
                border: Border.all(color: Palette.aquayarWhite, width: .4),
                borderRadius: BorderRadius.circular(100),
                color: Palette.aquayarWhite.withOpacity(.52)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: SvgPicture.asset("assets/svgs/aquayar_white_icon.svg"),
                ),
              ),
            ),
          ))
    ]);
  }
}
