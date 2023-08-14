import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:aquayar_driver/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessfulOrderView extends StatelessWidget {
  const SuccessfulOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Column(
        children: [
          const CustomSpacer(
            flex: 10,
          ),
          Text(
            "This trip has been completed successfully!",
            textAlign: TextAlign.center,
            style: AquayarTextStyles.h1,
          ),
          Text(
            "Thank you for faster delivery of water to help our community.",
            textAlign: TextAlign.center,
            style: AquayarTextStyles.greyBody,
          ),
          const CustomSpacer(
            flex: 5,
          ),
          Material(
            elevation: 3,
            shape: const CircleBorder(),
            shadowColor: const Color(0xff030D45).withOpacity(.2),
            child: Container(
              height: 90.h,
              width: 90.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.aquayarWhite,
                  border: Border.all(color: Palette.lightGrey)),
              child: Center(
                child: Container(
                  height: 64.h,
                  width: 654.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xff7BF4C8),
                            Color(0xff56F1B9),
                          ])),
                  child: Icon(
                    Icons.check,
                    size: 20.h,
                    color: Palette.aquayarWhite,
                  ),
                ),
              ),
            ),
          ),
          const CustomSpacer(
            flex: 3,
          ),
          Container(
            width: 250.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: Palette.offWhite,
                border: Border.all(color: Palette.lightGrey),
                borderRadius: BorderRadius.circular(30.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Congrats!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Palette.aquayarGrey, fontSize: 14.sp),
                ),
                const CustomSpacer(
                  flex: 1,
                ),
                Text(
                  "+\$2300",
                  style:
                      TextStyle(color: Palette.aquayarBlack, fontSize: 32.sp),
                ),
                const CustomSpacer(
                  flex: 1,
                ),
                Text(
                  "has been added to wallet",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Palette.aquayarGrey, fontSize: 14.sp),
                ),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset("assets/svgs/light_blue_wave.svg"),
              SvgPicture.asset("assets/svgs/dark_blue_wave.svg"),
              Positioned(
                bottom: size.height * .15,
                child: Container(
                  width: size.width * .92,
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: const Color(0xff5cb0e6),
                      borderRadius: BorderRadius.circular(30.w)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rate the customer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Palette.aquayarWhite, fontSize: 20.sp),
                      ),
                      const CustomSpacer(
                        flex: 1,
                      ),
                      Text(
                        "We take your reviews and complaints very seriously.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Palette.aquayarWhite, fontSize: 14.sp),
                      ),
                      const CustomSpacer(
                        flex: 2,
                      ),
                      Material(
                        elevation: 3,
                        shape: const CircleBorder(),
                        color: const Color(0xffF2F2F2).withOpacity(.32),
                        shadowColor: Colors.transparent,
                        child: SizedBox(
                          height: 25.h,
                          width: 25.h,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Palette.aquayarWhite,
                            size: 12.h,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.popUntil(
                        context, (Route<dynamic> route) => route.isFirst);
                  },
                  child: Container(
                    height: 38.h,
                    width: size.width * .92,
                    decoration: BoxDecoration(
                        color: Palette.aquayarWhite,
                        borderRadius: BorderRadius.circular(30.w)),
                    child: Center(
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xff61C7F9),
                              Color(0xff0579CE),
                            ]).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Text(
                          "Proceed to home",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
