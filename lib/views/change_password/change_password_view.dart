import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(
          context: context,
          text: "Change Password",
        ),
        builder: (context, size) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSpacer(
                      flex: 4,
                    ),
                    const PasswordTextField(
                      label: "Enter Current Password",
                    ),
                    const CustomSpacer(
                      flex: 1,
                    ),
                    const PasswordTextField(
                      label: "Enter new Password",
                    ),
                    const CustomSpacer(
                      flex: 1,
                    ),
                    const PasswordTextField(
                      label: "Confirm Password",
                    ),
                    const CustomSpacer(
                      flex: 5,
                    ),
                    Button(
                      text: "Reset Password",
                      onPressed: () {},
                      halfSized: true,
                    ),
                    const CustomSpacer(
                      flex: 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
