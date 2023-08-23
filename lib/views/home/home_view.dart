import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:aquayar_driver/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isWalletVisible = true;
  void toggleVisibility() {
    setState(() {
      _isWalletVisible = !_isWalletVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        scaffoldKey: _scaffoldKey,
        drawer: Container(
          color: Palette.aquayarWhite,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomSpacer(
                  flex: 10,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                          height: 20.h,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 20.h,
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 190.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.h),
                            color: Colors.white,
                            border: Border.all(color: Palette.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/location.svg",
                              height: 15.h,
                            ),
                            const CustomSpacer(
                              flex: 1.5,
                              horizontal: true,
                            ),
                            Flexible(
                              child: Text(
                                'Enugu, Nigeria',
                                style: AquayarTextStyles.body,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomSpacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 23.h,
                      backgroundImage:
                          const AssetImage("assets/images/onboarding_two.png"),
                    ),
                    const CustomSpacer(
                      flex: 2,
                      horizontal: true,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Henry Immanuel",
                          style: TextStyle(
                              fontSize: 21.sp, color: Palette.aquayarBlack),
                        ),
                        Text(
                          "AE-255-EA",
                          style: TextStyle(
                              fontSize: 15.sp, color: Palette.aquayarGrey),
                        ),
                        Text(
                          "Driver",
                          style: TextStyle(
                              fontSize: 13.sp, color: Palette.aquayarGrey),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 20.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                          color: Palette.green,
                          borderRadius: BorderRadius.circular(20.w)),
                      child: const Center(
                          child: Text(
                        "VERIFIED",
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                ),
                const CustomSpacer(
                  flex: 2,
                ),
                InkWell(
                  onTap: () {
                    toggleVisibility();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PasswordVisibilityIcon(
                        onPressed: () {},
                        color: Palette.aquayarGrey,
                        value: !_isWalletVisible,
                        size: 14.h,
                      ),
                      const CustomSpacer(
                        flex: .5,
                        horizontal: true,
                      ),
                      Text(
                        _isWalletVisible ? "Hide   " : "Show    ",
                        style: TextStyle(
                            color: Palette.aquayarGrey, fontSize: 14.sp),
                      )
                    ],
                  ),
                ),
                const CustomSpacer(
                  flex: 1,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.w, top: 15.h, bottom: 15.h, right: 20.w),
                  decoration: BoxDecoration(
                      color: Palette.aquayarBlack,
                      borderRadius: BorderRadius.circular(20.h)),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Main wallet",
                            style: TextStyle(
                                fontSize: 13.sp, color: Palette.aquayarWhite),
                          ),
                          const CustomSpacer(
                            flex: 1,
                          ),
                          Text(
                            _isWalletVisible ? "\$24,000.45" : "*****",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Palette.aquayarWhite),
                          ),
                          const CustomSpacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, withdrawBalanceViewRoute);
                        },
                        child: Container(
                          height: 20.h,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: Palette.aquayarWhite,
                              borderRadius: BorderRadius.circular(20.w)),
                          child: const Center(
                              child: Text(
                            "Withdraw Balance",
                            style: TextStyle(color: Palette.aquayarBlack),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                const CustomSpacer(
                  flex: 3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Your driver stats:",
                        style: AquayarTextStyles.greyBody,
                      ),
                      const Spacer(),
                      SvgPicture.asset("assets/svgs/driving.svg"),
                      const CustomSpacer(
                        flex: 1,
                        horizontal: true,
                      ),
                      Text(
                        "246 trips",
                        style: AquayarTextStyles.body,
                      ),
                      const Spacer(),
                      const Icon(Icons.star),
                      const CustomSpacer(
                        flex: 1,
                        horizontal: true,
                      ),
                      Text(
                        "3.0",
                        style: AquayarTextStyles.body,
                      ),
                    ],
                  ),
                ),
                const CustomSpacer(
                  flex: 4,
                ),
                HomeOptions(
                  imagePath1: "person",
                  label1: "Edit Profile",
                  imagePath2: "key",
                  label2: "Change Password",
                  onPressed1: () {
                    Navigator.pushNamed(context, editProfileViewRoute);
                  },
                  onPressed2: () {
                    Navigator.pushNamed(context, changePasswordViewRoute);
                  },
                ),
                const CustomSpacer(
                  flex: 2,
                ),
                HomeOptions(
                  imagePath1: "support",
                  label1: "Help & Support",
                  imagePath2: "feedback",
                  label2: "Give Feedback",
                  onPressed1: () {},
                  onPressed2: () {},
                ),
                const CustomSpacer(
                  flex: 2,
                ),
                const HomeOptionsRow(
                  label: "Terms of use",
                ),
                const CustomSpacer(
                  flex: 2,
                ),
                const HomeOptionsRow(
                  label: "Delete Account",
                  rowColor: Palette.red,
                  imagePath: "red_trash",
                ),
                const CustomSpacer(
                  flex: 6,
                ),
                Button(
                  text: "Logout",
                  onPressed: () {},
                  outlined: true,
                  textColor: Palette.red,
                ),
                const CustomSpacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
        builder: (context, size) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSpacer(
                  flex: 8,
                ),
                const CustomSpacer(
                  flex: 1,
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .79,
                      margin: EdgeInsets.symmetric(vertical: 32.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.lightGrey),
                          borderRadius: BorderRadius.circular(20.w),
                          color: Palette.offWhite),
                    ),
                    Container(
                      width: 102.w,
                      height: 32.h,
                      margin: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.lightGrey),
                          borderRadius: BorderRadius.circular(30.w),
                          color: Palette.aquayarWhite),
                      child: Center(
                          child: Text(
                        "0.0",
                        style: TextStyle(
                            color: Palette.aquayarGrey, fontSize: 16.sp),
                      )),
                    ),
                    Text(
                      "Water left in tank",
                      style: TextStyle(color: Palette.grey2, fontSize: 13.sp),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(Icons.menu))),
                    Positioned(
                      right: 10.w,
                      top: 30.h,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, rejectReasonViewRoute);
                        },
                        child: Container(
                          width: 95.w,
                          height: 30.h,
                          margin: EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Palette.lightGrey),
                              borderRadius: BorderRadius.circular(30.w),
                              color: Palette.aquayarWhite),
                          child: Center(
                              child: Text(
                            "Reject",
                            style: TextStyle(fontSize: 14.sp),
                          )),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * .07,
                      child: Container(
                        width: size.width * .87,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: Palette.lightGrey),
                            borderRadius: BorderRadius.circular(25.w),
                            color: Palette.aquayarWhite),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svgs/person.svg",
                                  color: Palette.aquayarBlack,
                                ),
                                const CustomSpacer(
                                  flex: 3,
                                  horizontal: true,
                                ),
                                Text(
                                  "Frankpeter Ani",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                const Spacer(),
                                Container(
                                  height: 22.h,
                                  width: 73.w,
                                  decoration: BoxDecoration(
                                      color: Palette.offWhite,
                                      border:
                                          Border.all(color: Palette.lightGrey),
                                      borderRadius:
                                          BorderRadius.circular(30.w)),
                                  child: Center(
                                      child: Text(
                                    "AQUAYAR",
                                    style: TextStyle(
                                        color: Palette.aquayarGrey,
                                        fontSize: 12.sp),
                                  )),
                                )
                              ],
                            ),
                            const CustomSpacer(
                              flex: 1,
                            ),
                            Row(
                              children: [
                                const CustomIcon(
                                  path: "location",
                                ),
                                const CustomSpacer(
                                  flex: 2,
                                  horizontal: true,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location to deliver",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Palette.aquayarGrey),
                                    ),
                                    Text(
                                      "WTC Estate, Uwani, Enugu",
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const CustomSpacer(
                              flex: 1,
                            ),
                            const Divider(
                              color: Palette.lightGrey,
                              thickness: .5,
                            ),
                            const CustomSpacer(
                              flex: 1,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const CustomIcon(
                                  path: "water_drop",
                                ),
                                const CustomSpacer(
                                  flex: 2,
                                  horizontal: true,
                                ),
                                Text(
                                  "500",
                                  style:
                                      TextStyle(fontSize: 23.sp, height: 0.8),
                                ),
                                Text(
                                  " Litres",
                                  style: TextStyle(
                                      color: Palette.aquayarGrey,
                                      fontSize: 14.sp),
                                ),
                                const Spacer(),
                                const CustomIcon(
                                  path: "money",
                                ),
                                const CustomSpacer(
                                  flex: 2,
                                  horizontal: true,
                                ),
                                Text(
                                  "\$500",
                                  style:
                                      TextStyle(fontSize: 23.sp, height: 0.8),
                                ),
                                Text(
                                  " .32",
                                  style: TextStyle(
                                      color: Palette.aquayarGrey,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                            const CustomSpacer(
                              flex: 4,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 35.h,
                                    width: 35.h,
                                    padding: EdgeInsets.all(3.h),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Palette.lightGrey,
                                            width: 1.5)),
                                    child:
                                        const Icon(Icons.volume_off_outlined)),
                                const Spacer(),
                                Button(
                                  text: "Click to accept",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, undergoingDeliveryViewRoute);
                                  },
                                  color: Palette.darkGreen,
                                  size: Size(size.width * .6, 36.h),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * .4,
                      child: Container(
                        height: 32.h,
                        width: size.width * .89,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.w),
                            gradient: const LinearGradient(colors: [
                              Color(0xffDEFBFF),
                              Color(0xff98EDF9),
                            ])),
                        child: Row(
                          children: [
                            Text(
                              "Incoming water order",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.aquayarBlack),
                            ),
                            const Spacer(),
                            Text(
                              "Rejecting in ",
                              style: TextStyle(
                                  color: Palette.aquayarGrey, fontSize: 13.sp),
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  color: Palette.aquayarBlack,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              " secs",
                              style: TextStyle(
                                  color: Palette.aquayarGrey, fontSize: 13.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class HomeOptionsRow extends StatelessWidget {
  final String? imagePath;
  final String label;
  final Color? rowColor;
  const HomeOptionsRow({
    super.key,
    this.imagePath,
    required this.label,
    this.rowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Palette.offWhite,
          border: Border.all(color: Palette.lightGrey),
          borderRadius: BorderRadius.circular(30.w)),
      child: Column(
        children: [
          Row(
            children: [
              if (imagePath != null)
                SvgPicture.asset("assets/svgs/$imagePath.svg"),
              const CustomSpacer(
                flex: 3,
                horizontal: true,
              ),
              Text(
                label,
                style: TextStyle(
                    fontSize: 16.sp, color: rowColor ?? Palette.aquayarGrey),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: Palette.aquayarGrey,
                size: 12.h,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HomeOptions extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;
  final String label1;
  final String label2;
  final Function() onPressed1;
  final Function() onPressed2;
  const HomeOptions(
      {super.key,
      required this.imagePath1,
      required this.imagePath2,
      required this.label1,
      required this.label2,
      required this.onPressed1,
      required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Palette.offWhite,
          border: Border.all(color: Palette.lightGrey),
          borderRadius: BorderRadius.circular(30.w)),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed1,
            child: Row(
              children: [
                SvgPicture.asset("assets/svgs/$imagePath1.svg"),
                const CustomSpacer(
                  flex: 3,
                  horizontal: true,
                ),
                Text(
                  label1,
                  style: AquayarTextStyles.greyBody.copyWith(fontSize: 16.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Palette.aquayarGrey,
                  size: 12.h,
                )
              ],
            ),
          ),
          const CustomSpacer(
            flex: 1,
          ),
          const Divider(
            color: Palette.aquayarGrey,
          ),
          const CustomSpacer(
            flex: 1,
          ),
          InkWell(
            onTap: onPressed2,
            child: Row(
              children: [
                SvgPicture.asset("assets/svgs/$imagePath2.svg"),
                const CustomSpacer(
                  flex: 3,
                  horizontal: true,
                ),
                Text(
                  label2,
                  style: AquayarTextStyles.greyBody.copyWith(fontSize: 16.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Palette.aquayarGrey,
                  size: 12.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
