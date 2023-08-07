import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

var maskFormatter = MaskTextInputFormatter(
    initialText: "+",
    mask: '###-###-###-####',
    type: MaskAutoCompletionType.eager,
    filter: {"#": RegExp(r'[0-9]')});
bool _hidePassword = true;

class _SignUpViewState extends State<SignUpView> {
  void toggleVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(
          context: context,
          actionWidgets: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset("assets/svgs/aquayar_logo_and_text.svg"),
            )
          ],
        ),
        builder: (context, size) {
          return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomSpacer(
                          flex: 2,
                        ),
                        Text(
                          "Create a",
                          style: TextStyle(fontSize: 32.sp),
                        ),
                        Row(
                          children: [
                            Text("driver account.",
                                style: TextStyle(fontSize: 32.sp)),
                            const Spacer(),
                            StepCounter(widgetIndex: index)
                          ],
                        ),
                        const CustomSpacer(
                          flex: 4,
                        ),
                        Form(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Your email address",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                const Spacer(),
                                Text(
                                  "This will be your username",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Palette.grey2),
                                )
                              ],
                            ),
                            const CustomSpacer(
                              flex: 1,
                            ),
                            const CustomTextField(
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const CustomSpacer(
                              flex: 2,
                            ),
                            CustomTextField(
                              keyboardType: TextInputType.phone,
                              formatters: [maskFormatter],
                              label: "Phone number",
                              prefix: Container(
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
                                      height: 40.h,
                                      width: 1,
                                      color: Palette.lightGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const CustomSpacer(
                              flex: 2,
                            ),
                            CustomTextField(
                              obscureText: _hidePassword,
                              label: "Choose a password",
                              suffix: PasswordVisibilityIcon(
                                onPressed: toggleVisibility,
                                value: _hidePassword,
                              ),
                            ),
                            const CustomSpacer(
                              flex: 3,
                            ),
                            Row(
                              children: [
                                Button(
                                  text: "Cancel",
                                  onPressed: () {},
                                  halfSized: true,
                                  outlined: true,
                                  textColor: Palette.aquayarGrey,
                                ),
                                const Spacer(),
                                Button(
                                  text: "Next",
                                  onPressed: () {},
                                  halfSized: true,
                                )
                              ],
                            ),
                            const CustomSpacer(
                              flex: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                const CustomSpacer(
                                  flex: 3,
                                  horizontal: true,
                                ),
                                Button(
                                  text: "Login",
                                  onPressed: () {},
                                  size: Size(70.w, 28.h),
                                  outlined: true,
                                  textColor: Palette.aquayarBlack,
                                )
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

class StepCounter extends StatefulWidget {
  final int widgetIndex;
  const StepCounter({
    required this.widgetIndex,
    super.key,
  });

  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List<Widget>.generate(
      3,
      (index) {
        bool isSelected = widget.widgetIndex == index;
        return Container(
          margin: EdgeInsets.only(right: 5.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                    gradient: isSelected
                        ? blueGradient()
                        : const LinearGradient(
                            colors: [Palette.lightGrey, Palette.lightGrey]),
                    borderRadius: BorderRadius.circular(50.w)),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    width: 25.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                        color: Palette.aquayarWhite,
                        borderRadius: BorderRadius.circular(30.w)),
                    child: Center(
                        child: Text("${index + 1}",
                            style: TextStyle(fontSize: 12.sp))),
                  ),
                )),
            const CustomSpacer(
              flex: .8,
            ),
            Visibility(
              visible: isSelected,
              child: Container(
                width: 20.w,
                height: 2,
                decoration: BoxDecoration(
                  gradient: blueGradient(),
                ),
              ),
            )
          ]),
        );
      },
    ));
  }
}

LinearGradient blueGradient() {
  return const LinearGradient(
      colors: [Palette.firstGradientBlue, Palette.secondGradientBlue]);
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      print(text.length);
      if (nonZeroIndex <= 5) {
        print("non");
        print(nonZeroIndex);
        if (nonZeroIndex % 5 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 12 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
