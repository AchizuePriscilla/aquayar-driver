import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _hidePassword = true;

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
          implyLeading: false,
          actionWidgets: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset("assets/svgs/aquayar_logo_and_text.svg"),
            )
          ],
        ),
        builder: (context, size) {
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
                    "Login",
                    style: AquayarTextStyles.h1,
                  ),
                  const CustomSpacer(
                    flex: 4,
                  ),
                  Form(
                      child: Column(
                    children: [
                      const CustomSpacer(
                        flex: 1,
                      ),
                      const CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                        label: "Email address or phone number",
                      ),
                      const CustomSpacer(
                        flex: 2,
                      ),
                      CustomTextField(
                        obscureText: _hidePassword,
                        label: "Password",
                        suffix: PasswordVisibilityIcon(
                          onPressed: toggleVisibility,
                          value: _hidePassword,
                        ),
                      ),
                      const CustomSpacer(
                        flex: 3,
                      ),
                      Button(
                        text: "Log in",
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, homeViewRoute);
                        },
                      ),
                      const CustomSpacer(
                        flex: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          const CustomSpacer(
                            flex: 3,
                            horizontal: true,
                          ),
                          Button(
                            text: "Sign Up",
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                  context, signUpViewRoute);
                            },
                            size: Size(70.w, 28.h),
                            outlined: true,
                            textColor: Palette.aquayarBlack,
                          )
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          );
        });
  }
}
