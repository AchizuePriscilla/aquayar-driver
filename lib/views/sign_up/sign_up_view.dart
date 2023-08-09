import 'package:aquayar_driver/navigation/media_upload_arg.dart';
import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
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

class _SignUpViewState extends State<SignUpView> {
  final PageController _pageController = PageController();
  // int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<SignUpVM>().initState(_pageController);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var signUpVM = context.read<SignUpVM>();
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
              controller: signUpVM.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                signUpVM.changePage(index);
                setState(() {
                  signUpVM.currentIndex = index;
                });
              },
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
                        signUpPages[index],
                      ],
                    ),
                  ),
                );
              });
        });
  }
}

List<Widget> signUpPages = const [
  SignUpStepOneForm(),
  SignUpStepTwoForm(),
  SignUpStepThreeForm()
];

class SignUpStepOneForm extends StatefulWidget {
  const SignUpStepOneForm({
    super.key,
  });

  @override
  State<SignUpStepOneForm> createState() => _SignUpStepOneFormState();
}

class _SignUpStepOneFormState extends State<SignUpStepOneForm> {
  var maskFormatter = MaskTextInputFormatter(
      initialText: "+",
      mask: '###-###-###-####',
      type: MaskAutoCompletionType.eager,
      filter: {"#": RegExp(r'[0-9]')});
  bool _hidePassword = true;

  void toggleVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var signUpVM = context.read<SignUpVM>();
    return Form(
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
              style: TextStyle(fontSize: 12.sp, color: Palette.grey2),
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
            Button(
              text: "Next",
              onPressed: () async {
                var res = await Navigator.pushNamed(
                    context, phoneVerificationViewRoute);
                if (res == true) {
                  signUpVM.changePage(2);
                  setState(() {
                    signUpVM.currentIndex = 2;
                  });
                }
              },
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
    ));
  }
}

class SignUpStepTwoForm extends StatefulWidget {
  const SignUpStepTwoForm({
    super.key,
  });

  @override
  State<SignUpStepTwoForm> createState() => _SignUpStepTwoFormState();
}

class _SignUpStepTwoFormState extends State<SignUpStepTwoForm> {
  @override
  Widget build(BuildContext context) {
    var signUpVM = context.read<SignUpVM>();
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        CustomDropDown(
          items: [
            for (var gender in ["Male", "Female"])
              DropdownMenuItem(
                value: gender,
                onTap: () {},
                child: Text(gender),
              )
          ],
          onchanged: (item) {},
          label: "Gender",
        ),
        const CustomSpacer(
          flex: 3,
        ),
        CustomDropDown(
          items: [
            for (var gender in ["Male", "Female"])
              DropdownMenuItem(
                value: gender,
                onTap: () {},
                child: Text(gender),
              )
          ],
          onchanged: (item) {},
          label: "Current City",
        ),
        const CustomSpacer(
          flex: 3,
        ),
        const CustomTextField(
          label: "Vehicle License Plate",
        ),
        const CustomSpacer(
          flex: 3,
        ),
        CustomDropDown(
          items: [
            for (var gender in ["Male", "Female"])
              DropdownMenuItem(
                value: gender,
                onTap: () {},
                child: Text(gender),
              )
          ],
          onchanged: (item) {},
          label: "Vehicle Main Color",
        ),
        const CustomSpacer(
          flex: 3,
        ),
        CustomDropDown(
          items: [
            for (var gender in ["Male", "Female"])
              DropdownMenuItem(
                value: gender,
                onTap: () {},
                child: Text(gender),
              )
          ],
          onchanged: (item) {},
          label: "Vehicle Secondary Color",
        ),
        const InfoRow(
          info: "This is Optional",
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
          "Choose your water tanker size",
          style: TextStyle(fontSize: 15.sp),
        ),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              List<int> tankerSizes = [1500, 2000, 2500, 3000, 4000];
              return Container(
                margin: EdgeInsets.only(right: 10.w),
                child: Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.h)),
                    side: const BorderSide(color: Palette.lightGrey),
                    backgroundColor: Palette.aquayarWhite,
                    label: Text(
                      tankerSizes[index].toString(),
                      style: AquayarTextStyles.greyBody,
                    )),
              );
            },
            itemCount: 5,
          ),
        ),
        const InfoRow(info: "This is optional and can be changed"),
        const CustomSpacer(
          flex: 5,
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
              onPressed: () {
                signUpVM.changePage(3);
                setState(() {
                  signUpVM.currentIndex = 3;
                });
              },
              halfSized: true,
            )
          ],
        ),
        const CustomSpacer(
          flex: 4,
        ),
      ],
    ));
  }
}

class InfoRow extends StatelessWidget {
  final String info;
  const InfoRow({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          color: Palette.aquayarGrey,
          size: 14.h,
        ),
        const CustomSpacer(
          flex: 1,
          horizontal: true,
        ),
        Text(
          info,
          style: TextStyle(color: Palette.aquayarGrey, fontSize: 13.sp),
        )
      ],
    );
  }
}

class SignUpStepThreeForm extends StatefulWidget {
  const SignUpStepThreeForm({
    super.key,
  });

  @override
  State<SignUpStepThreeForm> createState() => _SignUpStepThreeFormState();
}

class _SignUpStepThreeFormState extends State<SignUpStepThreeForm> {
  @override
  Widget build(BuildContext context) {
    var signUpVM = context.read<SignUpVM>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your Verification",
          style: TextStyle(fontSize: 15.sp),
        ),
        const CustomSpacer(
          flex: 1,
        ),
        const ItemVerificationWidget(
          title: "ID Verification",
          subtitle: "NIN/Driver’s Liscense/Voter’s Card",
          isVerified: true,
          titleForMediaPage: "Exterior Photo of your Water Truck",
          subtitleForMediaPage:
              "Upload a clear exterior photo that captures the plate number on the truck.",
          sampleMediaPath: "",
        ),
        const CustomSpacer(
          flex: 2,
        ),
        const ItemVerificationWidget(
          title: "ID Verification",
          subtitle: "NIN/Driver’s Liscense/Voter’s Card",
          isVerified: false,
          titleForMediaPage: "Exterior Photo of your Water Truck",
          subtitleForMediaPage:
              "Upload a clear exterior photo that captures the plate number on the truck.",
          sampleMediaPath: "",
        ),
        const CustomSpacer(
          flex: 3,
        ),
        Text(
          "Truck Verification",
          style: TextStyle(fontSize: 15.sp),
        ),
        const CustomSpacer(
          flex: 1,
        ),
        const ItemVerificationWidget(
          title: "Exterior Photo of your Water Truck",
          isVerified: false,
          titleForMediaPage: "Exterior Photo of your Water Truck",
          subtitleForMediaPage:
              "Upload a clear exterior photo that captures the plate number on the truck.",
          sampleMediaPath: "",
        ),
        const CustomSpacer(
          flex: 2,
        ),
        const ItemVerificationWidget(
          title: "Interior Photo of your Water Truck",
          isVerified: false,
          titleForMediaPage: "Exterior Photo of your Water Truck",
          subtitleForMediaPage:
              "Upload a clear exterior photo that captures the plate number on the truck.",
          sampleMediaPath: "",
        ),
        const CustomSpacer(
          flex: 2,
        ),
        const ItemVerificationWidget(
          title: "Pump Photo of your Water Truck",
          isVerified: false,
          titleForMediaPage: "Exterior Photo of your Water Truck",
          subtitleForMediaPage:
              "Upload a clear exterior photo that captures the plate number on the truck.",
          sampleMediaPath: "",
        ),
        const CustomSpacer(
          flex: 2,
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
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, verificationUnderReviewRoute);
              },
              halfSized: true,
            )
          ],
        ),
        const CustomSpacer(
          flex: 4,
        ),
      ],
    );
  }
}

class ItemVerificationWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool isVerified;
  final String titleForMediaPage;
  final String subtitleForMediaPage;
  final String sampleMediaPath;
  const ItemVerificationWidget({
    required this.isVerified,
    this.subtitle,
    required this.title,
    required this.sampleMediaPath,
    required this.subtitleForMediaPage,
    required this.titleForMediaPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, mediaUploadViewRoute,
            arguments: MediaUploadArgs(
                title: titleForMediaPage,
                subtitle: subtitleForMediaPage,
                sampleImagePath: sampleMediaPath));
      },
      child: Material(
        elevation: isVerified ? 4 : 0,
        shadowColor: Palette.aquayarWhite,
        borderRadius: BorderRadius.circular(25.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: subtitle == null ? 45.h : 60.h,
          decoration: BoxDecoration(
              color: isVerified ? Palette.aquayarWhite : Palette.offWhite,
              border: Border.all(color: Palette.lightGrey),
              borderRadius: BorderRadius.circular(25.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: isVerified
                            ? Palette.aquayarBlack
                            : Palette.aquayarGrey),
                  ),
                  if (subtitle != null) ...{
                    const CustomSpacer(
                      flex: 1,
                    ),
                    Text(
                      subtitle!,
                      style: TextStyle(
                          fontSize: 13.sp, color: Palette.aquayarGrey),
                    ),
                  }
                ],
              ),
              isVerified
                  ? const Icon(
                      Icons.check_circle_outline,
                      color: Palette.green,
                    )
                  : Icon(
                      Icons.warning_amber_rounded,
                      color: Palette.aquayarGrey,
                      size: 19.h,
                    )
            ],
          ),
        ),
      ),
    );
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
