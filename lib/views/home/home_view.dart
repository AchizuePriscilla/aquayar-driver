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
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: CustomAppBar(
          context: context,
          leadingIcon: Icons.close,
          titleWidget: Material(
            borderRadius: BorderRadius.circular(20.h),
            shadowColor: const Color(0xff0d450f).withOpacity(.1),
            elevation: 3,
            child: Container(
              width: 190.w,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.h),
                  color: Colors.white,
                  border: Border.all(color: Palette.lightGrey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Palette.aquayarBlack,
                    size: 20.h,
                  ),
                  const CustomSpacer(
                    flex: 1,
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
        ),
        builder: (context, size) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomSpacer(
                    flex: 4,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 23.h,
                        backgroundImage: const AssetImage(
                            "assets/images/onboarding_two.png"),
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
                    flex: 3,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
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
                              "\$24,000.45",
                              style: TextStyle(
                                  fontSize: 18.sp, color: Palette.aquayarWhite),
                            ),
                            const CustomSpacer(
                              flex: 1,
                            ),
                            Container(
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
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, top: 10.h, bottom: 10.h, right: 25.w),
                          decoration: BoxDecoration(
                              color: const Color(0xffFFDBDB),
                              borderRadius: BorderRadius.circular(20.h)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Debt wallet",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Palette.aquayarBlack),
                              ),
                              const CustomSpacer(
                                flex: 1,
                              ),
                              Text(
                                "\$24,000.45",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Palette.aquayarBlack),
                              ),
                              const CustomSpacer(
                                flex: 1,
                              ),
                              Container(
                                height: 20.h,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                    color: Palette.aquayarWhite,
                                    borderRadius: BorderRadius.circular(20.w)),
                                child: const Center(
                                    child: Text(
                                  "Pay debt",
                                  style: TextStyle(color: Palette.aquayarBlack),
                                )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const CustomSpacer(
                    flex: 2,
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
                    flex: 3,
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
                    imagePath: "trash",
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
