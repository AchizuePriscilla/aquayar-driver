import 'package:aquayar_driver/shared/shared.dart';
import 'package:aquayar_driver/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
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
                    style:
                        TextStyle(color: Palette.aquayarGrey, fontSize: 16.sp),
                  )),
                ),
                Text(
                  "Water left in tank",
                  style: TextStyle(color: Palette.grey2, fontSize: 13.sp),
                ),
                const Align(
                    alignment: Alignment.topLeft, child: Icon(Icons.menu)),
                Positioned(
                  right: 10.w,
                  top: 35.h,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
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
                                  border: Border.all(color: Palette.lightGrey),
                                  borderRadius: BorderRadius.circular(30.w)),
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
                          thickness: 1.5,
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
                              style: TextStyle(fontSize: 23.sp, height: 0.8),
                            ),
                            Text(
                              " Litres",
                              style: TextStyle(
                                  color: Palette.aquayarGrey, fontSize: 14.sp),
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
                              style: TextStyle(fontSize: 23.sp, height: 0.8),
                            ),
                            Text(
                              " .32",
                              style: TextStyle(
                                  color: Palette.aquayarGrey, fontSize: 14.sp),
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
                                        color: Palette.lightGrey, width: 1.5)),
                                child: const Icon(Icons.volume_off_outlined)),
                            const Spacer(),
                            Button(
                              text: "Click to accept",
                              onPressed: () {},
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
                    width: size.width * .87,
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
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        Text(
                          "Rejecting in ",
                          style: TextStyle(
                              color: Palette.aquayarGrey, fontSize: 14.sp),
                        ),
                        Text(
                          "10",
                          style: TextStyle(
                              color: Palette.aquayarBlack, fontSize: 16.sp),
                        ),
                        Text(
                          " secs",
                          style: TextStyle(
                              color: Palette.aquayarGrey, fontSize: 14.sp),
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

class CustomIcon extends StatelessWidget {
  final String path;

  const CustomIcon({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 22.h,
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Palette.lightGrey, width: 1.5)),
      child: SvgPicture.asset("assets/svgs/$path.svg"),
    );
  }
}
