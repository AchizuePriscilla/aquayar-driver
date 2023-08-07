import 'dart:async';

import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({super.key});

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final TextEditingController _controller =
      TextEditingController(text: "208420840230239");
  final _formKey = GlobalKey<FormState>();

  late StreamController<ErrorAnimationType> _errorController;
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
                    controller: _controller,
                    label: "Phone number",
                    prefix: const FlagPrefixIcon(),
                    suffix: const Icon(
                      Icons.check_circle_outline,
                      color: Palette.green,
                    )),
                const Spacer(),
                Button(text: "Verify", onPressed: () {}),
                const CustomSpacer(
                  flex: 4,
                ),
                // PinCodeFields(controller: _controller, validator: (val) {
                //           if (val.length < 6) {
                //             return 'Enter code';
                //           }
                //           return null;
                //         }, errorController: _errorController)
              ],
            ),
          );
        });
  }
}
