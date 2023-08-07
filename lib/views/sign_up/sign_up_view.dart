import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                              flex: 1,
                            ),
                            const CustomTextField(
                              keyboardType: TextInputType.phone,
                              label: "Phone number",
                            ),
                            const CustomSpacer(
                              flex: 1,
                            ),
                            const CustomTextField(
                              obscureText: true,
                              label: "Choose a password",
                            ),
                            const CustomSpacer(
                              flex: 2,
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
                              flex: 3,
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
                                  textColor: Palette.aquayarBlue,
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
