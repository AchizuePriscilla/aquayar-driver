import 'dart:async';

import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeVerificationView extends StatefulWidget {
  const CodeVerificationView({super.key});

  @override
  State<CodeVerificationView> createState() => _CodeVerificationViewState();
}

class _CodeVerificationViewState extends State<CodeVerificationView> {
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late StreamController<ErrorAnimationType> _errorController;

  ValueNotifier<bool> _hasError = ValueNotifier(false);
  ValueNotifier<bool> _buttonActive = ValueNotifier(false);
  void _onListen() {
    if (_controller.text.length < 4) {
      _buttonActive.value = false;
    } else {
      _buttonActive.value = true;
    }
  }

  @override
  void initState() {
    _errorController = StreamController<ErrorAnimationType>();
    super.initState();
    _controller.addListener(_onListen);
  }

  @override
  void dispose() {
    _errorController.close();
    _controller.removeListener(_onListen);
    super.dispose();
  }

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
                  "Enter the code",
                  style: AquayarTextStyles.h1,
                ),
                Text(
                  "A code has been successfully sent to your mobile number.",
                  style: AquayarTextStyles.greyBody,
                ),
                const CustomSpacer(
                  flex: 4,
                ),
                PinCodeFields(
                    controller: _controller,
                    validator: (val) {
                      if (val.length < 4) {
                        return 'Enter code';
                      }
                      return null;
                    },
                    errorController: _errorController),
                Row(
                  children: [
                    SvgPicture.asset("assets/svgs/clock.svg"),
                    const CustomSpacer(
                      flex: 1,
                      horizontal: true,
                    ),
                    Text(
                      "12:04s",
                      style: TextStyle(color: Palette.orange, fontSize: 14.sp),
                    ),
                    const CustomSpacer(
                      flex: 1,
                      horizontal: true,
                    ),
                    Text(
                      "waiting time",
                      style: AquayarTextStyles.greyBody,
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset("assets/svgs/right_arrow.svg"),
                        const CustomSpacer(
                          flex: 1,
                          horizontal: true,
                        ),
                        Text(
                          "Resend Code",
                          style: TextStyle(fontSize: 16.sp),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Button(
                    text: "Verify",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context, true);
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
