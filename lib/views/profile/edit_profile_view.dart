import 'package:aquayar_driver/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(
          context: context,
          text: "Edit Profile",
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
                    const CustomTextField(
                      label: "First name",
                    ),
                    const CustomSpacer(
                      flex: 3,
                    ),
                    const CustomTextField(
                      label: "Last name",
                    ),
                    const CustomSpacer(
                      flex: 3,
                    ),
                    const CustomTextField(
                      label: "Home Address",
                    ),
                    const CustomSpacer(
                      flex: 3,
                    ),
                    const CustomTextField(
                      label: "Driver License Number",
                    ),
                    const CustomSpacer(
                      flex: 2,
                    ),
                    Text(
                      "Water tanker size",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    const WaterTankerSizesList(),
                    const CustomSpacer(
                      flex: 2,
                    ),
                    SvgPicture.asset("assets/svgs/upload_license.svg"),
                    const CustomSpacer(
                      flex: 5,
                    ),
                    Button(
                      text: "Save",
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
