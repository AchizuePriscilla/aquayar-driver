import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';

class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({super.key});

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final TextEditingController _controller =
      TextEditingController(text: "208420840230239");

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(context: context),
        builder: (context, size) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSpacer(
                  flex: 2,
                ),
                Text(
                  "Phone Verification",
                  style: AquayarTextStyles.h1,
                ),
                Text(
                  "We need to do this to make sure we can reach you through this number. Make sure it's correct.",
                  style: AquayarTextStyles.greyBody,
                ),
                const CustomSpacer(
                  flex: 4,
                ),
                CustomTextField(
                    isBold: true,
                    controller: _controller,
                    label: "Phone number",
                    prefix: const FlagPrefixIcon(),
                    suffix: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Palette.green,
                      ),
                    )),
                const Spacer(),
                Button(
                    text: "Verify",
                    onPressed: () {
                      Navigator.pushNamed(context, codeVerificationViewRoute);
                    }),
                const CustomSpacer(
                  flex: 4,
                ),
              ],
            ),
          );
        });
  }
}
