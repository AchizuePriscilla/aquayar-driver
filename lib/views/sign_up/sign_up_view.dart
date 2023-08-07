import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:aquayar_driver/views/sign_up/sign_up_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

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
    return ListenableProvider(
        create: (_) => SignUpVM(),
        builder: (ctx, _) {
          return ResponsiveWidget(
              appBar: CustomAppBar(
                context: context,
                actionWidgets: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SvgPicture.asset(
                        "assets/svgs/aquayar_logo_and_text.svg"),
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
                                style: AquayarTextStyles.h1,
                              ),
                              Row(
                                children: [
                                  Text("driver account.",
                                      style: AquayarTextStyles.h1),
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
                                            fontSize: 12.sp,
                                            color: Palette.grey2),
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
                                    prefix: const FlagPrefixIcon(),
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
                                      Consumer<SignUpVM>(
                                          builder: (_, signUpVM, __) {
                                        return Button(
                                          text: "Next",
                                          onPressed: () {
                                            signUpVM.signUp();
                                          },
                                          halfSized: true,
                                        );
                                      })
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
