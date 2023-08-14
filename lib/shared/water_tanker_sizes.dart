import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';

class WaterTankerSizesList extends StatelessWidget {
  const WaterTankerSizesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          List<int> tankerSizes = [1500, 2000, 2500, 3000, 4000];
          return Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Chip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.h)),
                side: const BorderSide(color: Palette.lightGrey),
                backgroundColor: Palette.aquayarWhite,
                label: Text(
                  tankerSizes[index].toString(),
                  style: AquayarTextStyles.greyBody,
                )),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
