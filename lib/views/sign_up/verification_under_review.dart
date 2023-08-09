import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationUnderReview extends StatelessWidget {
  const VerificationUnderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (contex, size) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset("assets/svgs/hour_glass.svg"),
            const CustomSpacer(
              flex: 3,
            ),
            Text(
              "Verification under review",
              textAlign: TextAlign.center,
              style: AquayarTextStyles.h1,
            ),
            const CustomSpacer(
              flex: 2,
            ),
            Text(
              "We will inform you within the next 48 hours on the status of your verification.",
              textAlign: TextAlign.center,
              style: AquayarTextStyles.greyBody,
            ),
            const Spacer(),
            Button(text: "Go to home", onPressed: () {}),
            const CustomSpacer(
              flex: 5,
            ),
          ],
        ),
      );
    });
  }
}
